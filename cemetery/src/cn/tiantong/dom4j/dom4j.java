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
            //����tomb.xml�ļ�
		//����SAXReader�Ķ���reader
		SAXReader reader=new SAXReader();
		//ͨ��reader�����read��������tomb.xml�ļ�,��ȡdocument����
		try {
			Document document=reader.read(new File("resource/tomb.xml"));
			//ͨ��document�����ȡ���ڵ�sfireport
			Element element= document.getRootElement();
			//ͨ��element�����elementIterator������ȡ������
			Iterator it=element.elementIterator();
			 parseMutiXML(element);

	       /* //���ڵ��ٻ�ȡ���ڵ�
			String name = element.getName();
			List<Element> list = element.elements();
			
			// �ٻ�ȡ���ڵ��List����������ݣ�����ǿforѭ��
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
    // �õ����Ʋ���,���Խ��Ϊxml����Ҫ��ȡ����ĸ��ڵ�
    String name = element.getName();
    System.out.println(name);
    // ���ڵ��ٻ�ȡ���ڵ�
    @SuppressWarnings("unchecked")
    List<Element> list = element.elements();
    // �ٻ�ȡ���ڵ��List����������ݣ�����ǿforѭ��
    for (Element e : list) {
        System.out.println(e.getName() + "==>" + e.getTextTrim());
         }
    
    
    }




}
