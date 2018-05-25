package asklab.ui;

import javax.swing.*;
import javax.swing.text.DefaultCaret;
import javax.swing.border.Border;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

import java.io.*;
import java.util.List;
import java.util.Arrays;
import java.util.Random;
import java.util.Vector;

import java.awt.event.*;

//import javax.imageio.*;
/*import java.awt.event.*;
import java.awt.geom.*;
import java.awt.image.BufferedImage;
import java.net.*;
import javax.imageio.ImageIO;
import javax.swing.event.*;
import java.awt.event.MouseWheelEvent;
import java.awt.event.MouseWheelListener;
*/

import asklab.cpsf.CPSReasoner;

class GUIHelper
{
	static void setJPanelBorder(JPanel pan,String title)
	{	Border bGreyLine, bTitled1, bTitled2;
		bGreyLine = BorderFactory.createLineBorder(Color.LIGHT_GRAY, 1, true);
		bTitled1 = BorderFactory.createTitledBorder(bGreyLine, title, TitledBorder.LEFT, TitledBorder.TOP);
		pan.setBorder(bTitled1);
	}

	static JPanel makeBorder(JComponent obj,String title)
	{	JPanel pan=new JPanel();
		pan.setLayout(new BoxLayout(pan, BoxLayout.X_AXIS));
		pan.add(obj);
		GUIHelper.setJPanelBorder(pan,title);

		return(pan);
	}
}

class ReadStream implements Runnable
{	String name;
	InputStream is;
	Vector<String> v;
	boolean discard;
	Thread thread;
	public ReadStream(String name, InputStream is, Vector<String> v, boolean discard)
	{	this.name = name;
		this.is = is;
		this.v=v;
		this.discard=discard;
	}
	public void start ()
	{	thread = new Thread (this);
		thread.start ();
	}
	public void run ()
	{	try 
		{	InputStreamReader isr = new InputStreamReader (is);
			BufferedReader br = new BufferedReader (isr);   
			while (true)
			{	String s = br.readLine ();
				if (s == null) break;
				//System.out.println ("[" + name + "] " + s);
				if (!discard)
					v.addElement(s);
			}
			is.close ();    
		} catch (Exception ex)
		{	System.out.println ("Problem reading stream " + name + "... :" + ex);
			ex.printStackTrace ();
		}
	}
}

class ExecActionListener implements ActionListener
{	private String tmpFile;
	private String ontologyDir;
	private String sparqlFile;
	private JTextArea taASP,taRes;
	private JProgressBar progr;
	private Task task;

	class Task extends SwingWorker<Void, Void>
	{	@Override
		public Void doInBackground()
		{	try
			{	String sparqlQ=Utils.readFile(sparqlFile);
				System.out.println(sparqlFile+" loaded.");

				String aspQ=taASP.getText();

				progr.setIndeterminate(true);

				taRes.setText("");

				String res=CPSReasoner.query(sparqlQ,aspQ,ontologyDir);
				taRes.setText(res);

				progr.setIndeterminate(false);
			}
			catch(FileNotFoundException fnx)
			{	JOptionPane.showMessageDialog(null, "Unable to read SPARQL query from file 'dump.sparql'", "Error", JOptionPane.ERROR_MESSAGE);
			}
			catch(IOException iox)
			{	JOptionPane.showMessageDialog(null, "Unable to read SPARQL query from file 'dump.sparql'", "Error", JOptionPane.ERROR_MESSAGE);
			}

			return null;
	        }

	        public void done()
		{
		}
	}

	public ExecActionListener(String tmpFile,String ontologyDir,String sparqlFile,JTextArea taASP,JTextArea taRes,JProgressBar progr)
	{	this.tmpFile=tmpFile;
		this.ontologyDir=ontologyDir;
		this.taASP=taASP;
		this.taRes=taRes;
		this.progr=progr;
		this.sparqlFile=sparqlFile;
	}

	public void actionPerformed(ActionEvent e)
	{	task = new Task();
//        	task.addPropertyChangeListener(this);
		task.execute();
	}
}

class Utils
{
	static String readFile(String s) throws FileNotFoundException, IOException
	{	BufferedReader br = new BufferedReader(new FileReader(s));
		String res=readFile(br);
		br.close();
		return(res);
	}

	static String readFile(File f) throws FileNotFoundException, IOException
	{	BufferedReader br = new BufferedReader(new FileReader(f));
		String res=readFile(br);
		br.close();
		return(res);
	}

	static String readFile(BufferedReader br) throws IOException
	{	String str="",line;
		while((line=br.readLine())!=null)
			str=str+line+"\n";
		return(str);
	}
}

public class ReasonerUI
{
	final String sparqlFile=pkgPath("dump.sparql");
	final String tmpFile="./tmpfile.sparql";
	final String ontologyDir=pkgPath("ONTOLOGY/");

	public static void main(String[] args)
	{        new ReasonerUI();
	}

	String pkgPath(String p)
	{	if (getClass().getResource(p)==null)
		{	System.out.println("ERROR: path does not exist: "+p);
			return("");
		}

		return(getClass().getResource(p).getPath());
	}

	public ReasonerUI()
	{
		JFrame guiFrame = new JFrame();

		//make sure the program exits when the frame closes
		guiFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		guiFrame.setTitle("CPSReasoner "+CPSReasoner.version());
		guiFrame.setSize(1200,800);

		//This will center the JFrame in the middle of the screen
		guiFrame.setLocationRelativeTo(null);



		JPanel rightpan=new JPanel();
		rightpan.setLayout(new BoxLayout(rightpan, BoxLayout.Y_AXIS));
		//guiFrame.add(rightpan,BorderLayout.CENTER);

		guiFrame.add(rightpan,BorderLayout.CENTER);

		JTextArea taASP=new JTextArea();
		taASP.setEditable(true);
		taASP.setFont(new Font("monospaced", Font.PLAIN, 12));
		taASP.setText("");
		JScrollPane spASP = new JScrollPane(taASP);
		JPanel brdASP=GUIHelper.makeBorder(spASP,"ASP Query");
		brdASP.setVisible(true);

		JTextArea taRes=new JTextArea();
		taRes.setEditable(false);
		taRes.setFont(new Font("monospaced", Font.PLAIN, 12));
		((DefaultCaret) taRes.getCaret()).setUpdatePolicy(DefaultCaret.NEVER_UPDATE);
		JScrollPane spRes = new JScrollPane(taRes);

		JProgressBar progressBar = new JProgressBar(0, 100);
		progressBar.setIndeterminate(false);
		//Call setStringPainted now so that the progress bar height
		//stays the same whether or not the string is shown.
		progressBar.setString(" ");
		progressBar.setStringPainted(true);
		Border bGreyLine = BorderFactory.createLineBorder(Color.LIGHT_GRAY, 1, true);
		progressBar.setBorder(bGreyLine);
		//progressBar.setBackground (new Color (0, 0, 0, 0));
		JButton runB=new JButton("Run query");
		//runB.setEnabled(false);
		runB.addActionListener(new ExecActionListener(tmpFile,ontologyDir,sparqlFile,taASP,taRes,progressBar));

		JPanel pan;

		pan=new JPanel();
		pan.setLayout(new BoxLayout(pan, BoxLayout.X_AXIS));
		pan.add(new JLabel("    "));
		pan.add(brdASP);
		rightpan.add(pan);

		JButton quitB=new JButton("Exit");
		quitB.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{	System.exit(0);
			}
		});

		pan=new JPanel();
		pan.setLayout(new BoxLayout(pan, BoxLayout.X_AXIS));
		pan.add(runB);
		pan.add(new JLabel("    "));
		pan.add(progressBar);
		pan.add(new JLabel("    "));
		pan.add(quitB);

		rightpan.add(pan);
		rightpan.add(GUIHelper.makeBorder(spRes,"Result"));

		//make sure the JFrame is visible
		guiFrame.setVisible(true);
	}
}
