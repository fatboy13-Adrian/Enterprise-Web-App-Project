import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
public class Parser_dom {
static public void exploreNode(Node node) {
if( node.getNodeType()==Node.ELEMENT_NODE ){
if( node.getNodeName().equals("giftName") ){
if ( node.getFirstChild().getNodeType()==Node.TEXT_NODE )
System.out.println( "Gift Name: " +
node.getFirstChild().getNodeValue() );
}
else if( node.getNodeName().equals("promo") ){
if ( node.getFirstChild().getNodeType()==Node.TEXT_NODE ){
System.out.println( "Promotion : " +
node.getFirstChild().getNodeValue() );
System.out.println("------------------------------------------");
}
}
NodeList children = node.getChildNodes();
for( int i=0; i<children.getLength(); i++ )
exploreNode( children.item(i) );
}
}
public static void main( String args[] ) {
Document doc = null;
try{
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
doc = db.parse("Promotion.xml");
Element root = doc.getDocumentElement();
System.out.println( "Gift Names and Promotions: \n" );
exploreNode( root );
} catch (Exception e){
System.out.print( "Problem parsing file:" + e.getMessage() );
}
} //close for main()
} //close for class