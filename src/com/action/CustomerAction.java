package com.action;

import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.bean.Customer;
import com.dao.impl.CustomerDao;
import com.opensymphony.xwork2.ActionSupport;
/**�ͻ���ز���
 * @author zxj
 * 2013-10-06
 */

public class CustomerAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private CustomerDao cusdao;


	public String request()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		try
		{
			//System.out.println("request customer");
			cusdao=new CustomerDao();
			List<Customer> customers=cusdao.findCustomerList();
			//System.out.println(customers.get(0).getCustomer());
			request.setAttribute("customers", customers);
			
			return "customer";
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return "error";
		}

	}
	/**
	 * �����ͻ���Ϣ
	 * @return String
	 */
	public String export() {
		HttpServletResponse response=ServletActionContext.getResponse();
		
		try {
			
			String[] excelHeader = { "����", "�ֻ���"};
			cusdao=new CustomerDao();
			List<Customer> customers=cusdao.findCustomerList(); 
			HSSFWorkbook wb = new HSSFWorkbook();  
			HSSFSheet sheet = wb.createSheet("customer");  
			HSSFRow row = sheet.createRow((int) 0);  
			HSSFCellStyle style = wb.createCellStyle();  
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);  

			for (int i = 0; i < excelHeader.length; i++) {  
				HSSFCell cell = row.createCell(i);  
				cell.setCellValue(excelHeader[i]);  
				cell.setCellStyle(style);  
				sheet.autoSizeColumn(i);  
			}  

			for (int i = 0; i < customers.size(); i++) {  
				row = sheet.createRow(i + 1);  
				//Student student = customers.get(i);  
				row.createCell(0).setCellValue(customers.get(i).getCustomer());  
				row.createCell(1).setCellValue(customers.get(i).getMobile());    
			}    
			response.setContentType("application/vnd.ms-excel");  
			response.setHeader("Content-disposition", "attachment;filename=customers.xls");  
			OutputStream ouputStream = response.getOutputStream();  
			wb.write(ouputStream);  
			ouputStream.flush();  
			ouputStream.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	

}