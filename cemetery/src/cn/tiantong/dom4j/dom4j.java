package cn.tiantong.dom4j;

import java.io.File;
import java.util.Iterator;
import java.util.List;


import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class dom4j {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
            //解析tomb.xml文件
		//创建SAXReader的对象reader
		SAXReader reader=new SAXReader();
		//通过reader对象的read方法加载tomb.xml文件,获取document对象。
		try {
			Document document=reader.read(new File("resource/tomb.xml"));
			//通过document对象获取根节点sfireport
			Element element= document.getRootElement();
			//通过element对象的elementIterator方法获取迭代器
			Iterator it=element.elementIterator();
			 parseMutiXML(element);

	       /* //根节点再获取根节点
			String name = element.getName();
			List<Element> list = element.elements();
			
			// 再获取根节点的List和里面的内容，用增强for循环
			for (Element e : list) {
			
			Element root= document.getRootElement();
			List<Element> lis = root.elements();
	        if (list.size()==0) {
	            System.out.println(root.getName()+"==>"+root.getTextTrim());
	        }else {
	            for (Element element1:list) {
	            	System.out.println(element1.getName() + "==>" + element1.getTextTrim()+"==>" + element1.getStringValue());
	            }
	        }

			}	*/

		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
     
	
	
	private static void parseMutiXML(Element root) {
		 List<Element> list = root.elements();
	        if (list.size()==0) {
	            System.out.println(root.getName()+"==>"+root.getTextTrim());
	        }else {
	            for (Element element:list) {
	                parseMutiXML(element);
	            }
	        }
	    }


		

 private static void parseXML(Element element) {
    // 得到名称测试,测试结果为xml，需要获取这个的根节点
    String name = element.getName();
    System.out.println(name);
    // 根节点再获取根节点
    @SuppressWarnings("unchecked")
    List<Element> list = element.elements();
    // 再获取根节点的List和里面的内容，用增强for循环
    for (Element e : list) {
        System.out.println(e.getName() + "==>" + e.getTextTrim());
         }
    
    
    }




}
