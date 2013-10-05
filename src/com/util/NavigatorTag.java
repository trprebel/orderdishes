package com.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.util.Paginator;

public class NavigatorTag extends TagSupport{

	private static final String LAST_PAGE_KEY = "LAST_PAGE_KEY";
	private static final String NEXT_PAGE_KEY = "NEXT_PAGE_KEY";
	private static final String PRE_PAGE_KEY = "PRE_PAGE_KEY";
	private static final String FIRST_PAGE_KEY = "FIRST_PAGE_KEY";
	private static final String TOTAL_RECORD_KEY = "TOTAL_RECORD_KEY";
	private static final String NO_KEY = "NO_KEY";
	private static final String PAGE_KEY = "PAGE_KEY";
	private static final String NO_RESULT_KEY = "NO_ROW_KEY";
	private static final String LINE = "LINE";
	private static final String CURRPAGE_INPUT = "CURRPAGE_INPUT";//��ǰҳ�������
	private static final String PAGESIZE_INPUT = "PAGESIZE_INPUT";//ÿҳ���ȵ������
	private static final String GOJUMP = "GOJUMP";//��ת��ť
	// ���ݱ��ػ��������ԴMap
	private Map getResMap(String basePath) {
		Map map = new HashMap();
		// ~ for chinese
			map.put(LAST_PAGE_KEY, "<img src='"+basePath+"images/grid/page-last.gif' />");//βҳ
			map.put(NEXT_PAGE_KEY, "<img src='"+basePath+"images/grid/page-next.gif' />");////��һҳ
			map.put(PRE_PAGE_KEY, "<img src='"+basePath+"images/grid/page-prev.gif' />");//��һҳ
			map.put(FIRST_PAGE_KEY, "<img src='"+basePath+"images/grid/page-first.gif' />");//��һҳ
			map.put(LINE, "<img src='"+basePath+"images/grid/line.gif' />");//��ͷСͼ��
			
			
			
			map.put(TOTAL_RECORD_KEY, "�ܼ�¼��");
			map.put(NO_KEY, "��");
			map.put(PAGE_KEY, "ҳ");
			map.put(NO_RESULT_KEY, "û���ҵ��κμ�¼");
			return map;
		
	}


	public int doStartTag() throws JspException {
		ServletRequest servletrequest=  pageContext.getRequest();
		HttpServletRequest request=(HttpServletRequest)servletrequest;
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        //System.out.println(basePath);
			Map resMap = getResMap(basePath);
			 Object object=(Object)  request.getAttribute("paginator");
			 Paginator paginator=null;
			 if(object==null){//����Ĭ��ֵ
				 paginator=new Paginator();
			 }else{
			  paginator=(Paginator)  request.getAttribute("paginator");
			 }
		    //��ǰҳ
			 resMap.put(CURRPAGE_INPUT, "��<input class='textfield-input01' name='intputCurrentPage' id='intputCurrentPage' type='text'  value='"+paginator.getCurrentPage()+"' size='5' onkeyup=' if(this.value>99999) this.value=1;' />ҳ");
			//��ת��ť
			 resMap.put(GOJUMP, "<a href='#' onclick='goPage(document.forms[0].intputCurrentPage.value);return false;'><img src='"+basePath+"images/grid/done.gif'  border='0'/></a>");
			 
		// �ж��Ƿ���ʾ
			 if(paginator.getPageSize()<=0)
				 paginator.setPageSize(0);
			 if(paginator.getTotalRowsAmount()<=0)
				 paginator.setTotalRowsAmount(0,new ArrayList());
			pageContextWrite(printNavigation( paginator,  resMap) );
		
		return EVAL_BODY_INCLUDE;
	}

	private String defaultHref(Map resMap){
		
		String result="�Ҳ�������";
		return  result;
	}
	
	
	// ��ӡ������

	private String printNavigation(Paginator paginator, Map resMap) {
		
		StringBuffer html_body = new StringBuffer();
		html_body.append(getNavigations(paginator, resMap));
		//String jscode="<input type=\"hidden\" id=\"jscode\" value=\""+html_body.toString()+"\"/>";
		
		
	   return	html_body.toString();	
	}

	// �� 2/16 ҳ

	private String getCurrentPage(Paginator paginator, Map resMap) {
		StringBuffer buf = new StringBuffer();
		buf.append(resMap.get(NO_KEY)).append(paginator.getCurrentPage()).append("/").append(paginator.getTotalPages()).append(
				resMap.get(PAGE_KEY));
		return buf.toString();
	}

	// �ܼ�¼�� 301
	private String getTotalPages(Paginator paginator, Map resMap) {
		StringBuffer buf = new StringBuffer();
		buf.append(resMap.get(TOTAL_RECORD_KEY)).append(paginator.getTotalRowsAmount());
		return buf.toString();
	}

	// ��ҳ ��һҳ ��һҳ βҳ
	private String getNavigations(Paginator paginator, Map resMap) {
		StringBuffer buf = new StringBuffer();
		buf.append("<input  name='paginator.currentPage' id='paginator.currentPage'   type='hidden' value='"+paginator.getCurrentPage()+"'  />");
		buf.append("<ul id='pageUl'>");
		buf.append("<li>");
		buf.append(getHref(paginator, 1, (String)resMap.get(FIRST_PAGE_KEY),resMap,FIRST_PAGE_KEY)+"");//��ҳ
		buf.append("</li>");
		buf.append("<li>");
		buf.append(getHref(paginator, paginator.getCurrentPage() - 1, (String)resMap.get(PRE_PAGE_KEY),resMap,PRE_PAGE_KEY)+"");//��һҳ
		buf.append("</li>");
		buf.append("<li>"+resMap.get(LINE)+"</li>");
		buf.append("<li>");
		buf.append(resMap.get(CURRPAGE_INPUT));
		buf.append("</li>");
		//buf.append("<li>");
		//buf.append(resMap.get(LINE));
		//buf.append("</li>");
		//buf.append("<li>");
		//buf.append(resMap.get(PAGESIZE_INPUT));
		//buf.append("</li>");
		buf.append("<li>");
		buf.append(resMap.get(LINE));
		buf.append("</li>");
		buf.append("<li>");
		buf.append(getHref(paginator, paginator.getCurrentPage() + 1, (String)resMap.get(NEXT_PAGE_KEY),resMap,NEXT_PAGE_KEY)+"");//��һҳ
		buf.append("</li>");
		buf.append("<li>");
		buf.append(getHref(paginator, paginator.getTotalPages(), (String)resMap.get(LAST_PAGE_KEY),resMap,LAST_PAGE_KEY)+"");//βҳ
		buf.append("</li>");
		buf.append("<li>"+resMap.get(LINE)+"</li>");
		buf.append("<li>"+resMap.get(GOJUMP)+" </li>");
		buf.append(" <li>");
		buf.append(showContent(paginator)+"");
		buf.append("</li>");
		buf.append("</ul>");
		
		return buf.toString();
	}
	
	
	private String goJump(Paginator paginator,String basePath) {
			StringBuffer buf = new StringBuffer();
			buf.append("<a href='javascript:void(0)' onclick=goPage(document.forms[0].currentPage.value,document.forms[0].inputPagesize.value);><img src='"+basePath+"images/grid/done.gif'  border='0'/></a>");
			return buf.toString();
	}
	
	
	
	
	
	// ������ʾ������������
	private String showContent(Paginator paginator) {
		Collection collection=paginator.getItems();
		StringBuffer buf = new StringBuffer();
		if(collection==null||collection.size()==0){
			buf.append("�Ҳ�����ؼ�¼");
		}else{
			
			//buf.append("��ʾ��<label id='beginRows'>"+(paginator.getOffset()+1)+"</label>����<label id='endRows'>"+(paginator.getOffset()+collection.size())+"</label>����¼,");
			buf.append("�ܼ�¼��:<label id='totalRows'>"+paginator.getTotalRowsAmount()+"</label>,��ҳ��:<label id='totalPages'>"+paginator.getTotalPages()+"</label>");
		}
			return buf.toString();
	}	
	
	
	
	// ���ݵ�ǰҳ��ȡ������
	private String getHref(Paginator paginator, int pageNum, String textBody,Map resMap,String labId) {
		if (pageNum < 1 || pageNum > paginator.getTotalPages() || pageNum == paginator.getCurrentPage()) {
			if(textBody.equals((String)resMap.get(PRE_PAGE_KEY)))
					pageNum=pageNum+1;
			if(textBody.equals((String)resMap.get(NEXT_PAGE_KEY)))
				pageNum=pageNum-1;
			
		}
		int pagesize=paginator.getPageSize();
		Collection collection=   paginator.getItems();
		if(collection==null||collection.size()==0){
			pageNum=1;//�Ҳ�����¼Ĭ��Ϊ1
			pagesize=10;
		}
		
		
			StringBuffer buf = new StringBuffer();
			buf.append("<label id='"+labId+"'>");
			buf.append("<a href='javascript:goPage(").append(pageNum).append(")'>");
			buf.append(textBody);
			buf.append("</a></label>");
			return buf.toString();
	}	
	
	
	
	
	// ��ӡ
	private void pageContextWrite(String html) {

		try {
			JspWriter   out=  pageContext.getOut();
			 out.print(html);
			// out.close();
		} catch (Exception e) {
			throw new RuntimeException("pageContext write.io exception");
		}
	}
	
	



}
