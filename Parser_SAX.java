import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class Parser_SAX
{
	public static void main(String argv[])
	{
		try
		{
			SAXParserFactory factory = SAXParserFactory.newInstance();
			SAXParser saxParser = factory.newSAXParser();
			saxParser.parse("giftPrice.xml",new newHandler());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

class newHandler extends DefaultHandler
{
	boolean giftName = false;boolean gifts = false;
	public void startDocument()
	{
	}
	
	public void startElement(String uri,String localName,String qName,Attributes attributes)
	{
		if(qName.equalsIgnoreCase("giftName")) giftName = true;
		if(qName.equals("gifts")) gifts = true;
	}
	
	public void endElement(String uri,String localName,String qName)
	{
	}
	public void characters(char ch[],int start,int length)
	{
		if(giftName)
		{
			System.out.println("-------------------------------------");
			System.out.println("\tGift Name : "+(new String(ch,start,length)).trim());
			giftName=false;
		}
		if(gifts)
		{
			System.out.println("\tGifts : "+(new String(ch,start,length)).trim());
			gifts=false;
		
		}
	}
}