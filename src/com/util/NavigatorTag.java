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
	private static final String CURRPAGE_INPUT = "CURRPAGE_INPUT";//当前页的输入框
	private static final String PAGESIZE_INPUT = "PAGESIZE_INPUT";//每页长度的输入框
	private static final String GOJUMP = "GOJUMP";//跳转按钮
	// 根据本地环境获得资源Map
	private Map getResMap(String basePath) {
		Map map = new HashMap();
		// ~ for chinese
			map.put(LAST_PAGE_KEY, "<img src='"+basePath+"images/grid/page-last.gif' />");//尾页
			map.put(NEXT_PAGE_KEY, "<img src='"+basePath+"images/grid/page-next.gif' />");////下一页
			map.put(PRE_PAGE_KEY, "<img src='"+basePath+"images/grid/page-prev.gif' />");//上一页
			map.put(FIRST_PAGE_KEY, "<img src='"+basePath+"images/grid/page-first.gif' />");//第一页
			map.put(LINE, "<img src='"+basePath+"images/grid/line.gif' />");//箭头小图标
			
			
			
			map.put(TOTAL_RECORD_KEY, "总纪录数");
			map.put(NO_KEY, "第");
			map.put(PAGE_KEY, "页");
			map.put(NO_RESULT_KEY, "没有找到任何纪录");
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
			 if(object==null){//创建默认值
				 paginator=new Paginator();
			 }else{
			  paginator=(Paginator)  request.getAttribute("paginator");
			 }
		    //当前页
			 resMap.put(CURRPAGE_INPUT, "第<input class='textfield-input01' name='intputCurrentPage' id='intputCurrentPage' type='text'  value='"+paginator.getCurrentPage()+"' size='5' onkeyup=' if(this.value>99999) this.value=1;' />页");
			//跳转按钮
			 resMap.put(GOJUMP, "<a href='#' onclick='goPage(document.forms[0].intputCurrentPage.value);return false;'><img src='"+basePath+"images/grid/done.gif'  border='0'/></a>");
			 
		// 判断是否显示
			 if(paginator.getPageSize()<=0)
				 paginator.setPageSize(0);
			 if(paginator.getTotalRowsAmount()<=0)
				 paginator.setTotalRowsAmount(0,new ArrayList());
			pageContextWrite(printNavigation( paginator,  resMap) );
		
		return EVAL_BODY_INCLUDE;
	}

	private String defaultHref(Map resMap){
		
		String result="找不到对象";
		return  result;
	}
	
	
	// 打印导航条

	private String printNavigation(Paginator paginator, Map resMap) {
		
		StringBuffer html_body = new StringBuffer();
		html_body.append(getNavigations(paginator, resMap));
		//String jscode="<input type=\"hidden\" id=\"jscode\" value=\""+html_body.toString()+"\"/>";
		
		
	   return	html_body.toString();	
	}

	// 第 2/16 页

	private String getCurrentPage(Paginator paginator, Map resMap) {
		StringBuffer buf = new StringBuffer();
		buf.append(resMap.get(NO_KEY)).append(paginator.getCurrentPage()).append("/").append(paginator.getTotalPages()).append(
				resMap.get(PAGE_KEY));
		return buf.toString();
	}

	// 总纪录数 301
	private String getTotalPages(Paginator paginator, Map resMap) {
		StringBuffer buf = new StringBuffer();
		buf.append(resMap.get(TOTAL_RECORD_KEY)).append(paginator.getTotalRowsAmount());
		return buf.toString();
	}

	// 首页 上一页 下一页 尾页
	private String getNavigations(Paginator paginator, Map resMap) {
		StringBuffer buf = new StringBuffer();
		buf.append("<input  name='paginator.currentPage' id='paginator.currentPage'   type='hidden' value='"+paginator.getCurrentPage()+"'  />");
		buf.append("<ul id='pageUl'>");
		buf.append("<li>");
		buf.append(getHref(paginator, 1, (String)resMap.get(FIRST_PAGE_KEY),resMap,FIRST_PAGE_KEY)+"");//首页
		buf.append("</li>");
		buf.append("<li>");
		buf.append(getHref(paginator, paginator.getCurrentPage() - 1, (String)resMap.get(PRE_PAGE_KEY),resMap,PRE_PAGE_KEY)+"");//上一页
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
		buf.append(getHref(paginator, paginator.getCurrentPage() + 1, (String)resMap.get(NEXT_PAGE_KEY),resMap,NEXT_PAGE_KEY)+"");//下一页
		buf.append("</li>");
		buf.append("<li>");
		buf.append(getHref(paginator, paginator.getTotalPages(), (String)resMap.get(LAST_PAGE_KEY),resMap,LAST_PAGE_KEY)+"");//尾页
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
	
	
	
	
	
	// 根据显示多少条的内容
	private String showContent(Paginator paginator) {
		Collection collection=paginator.getItems();
		StringBuffer buf = new StringBuffer();
		if(collection==null||collection.size()==0){
			buf.append("找不到相关记录");
		}else{
			
			//buf.append("显示第<label id='beginRows'>"+(paginator.getOffset()+1)+"</label>条到<label id='endRows'>"+(paginator.getOffset()+collection.size())+"</label>条记录,");
			buf.append("总记录数:<label id='totalRows'>"+paginator.getTotalRowsAmount()+"</label>,总页数:<label id='totalPages'>"+paginator.getTotalPages()+"</label>");
		}
			return buf.toString();
	}	
	
	
	
	// 根据当前页获取链接字
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
			pageNum=1;//找不到记录默认为1
			pagesize=10;
		}
		
		
			StringBuffer buf = new StringBuffer();
			buf.append("<label id='"+labId+"'>");
			buf.append("<a href='javascript:goPage(").append(pageNum).append(")'>");
			buf.append(textBody);
			buf.append("</a></label>");
			return buf.toString();
	}	
	
	
	
	
	// 打印
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
