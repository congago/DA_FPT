package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Account;
import model.bean.QuangCao;
import model.bean.Tindang;
import model.bo.CheckBO;


/**
 * Servlet implementation class DA_checkchucnangquantrivien
 */
@WebServlet("/DA_checkchucnangquantrivien")
public class DA_checkchucnangquantrivien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DA_checkchucnangquantrivien() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String quanlytindang = request.getParameter("quanlytindang");
			String quanlythanhvien = request.getParameter("quanlythanhvien");
			String quanlythongtinkhac = request.getParameter("quanlythongtinkhac");
			String thongke = request.getParameter("thongke");
			String quanlychuatindang = request.getParameter("quanlychuatindang");
			String quaylai = request.getParameter("quaylai");
			
			
					
			if(null!=quanlytindang)
			{
				
				CheckBO checkBO = new CheckBO();
				ArrayList<Tindang> arrTD = new ArrayList<Tindang>();
				arrTD = checkBO.getTindang();
				request.setAttribute("arrTD", arrTD);
				RequestDispatcher rd = request.getRequestDispatcher("DA_quanlytinchuadang.jsp");
				rd.forward(request, response);
			}
			else if(null!=quanlythanhvien)
			{
				CheckBO checkBO = new CheckBO();
				ArrayList<Account> arrAccount = new ArrayList <Account>();
				arrAccount = checkBO.getAccount("");
				request.setAttribute("arrAccount", arrAccount);
				RequestDispatcher rd = request.getRequestDispatcher("showquanlythanhvien.jsp");
				rd.forward(request, response);
			}
			else if(null!= quanlythongtinkhac )
			{
				CheckBO checkBO = new CheckBO();
				ArrayList<QuangCao> arrV = new ArrayList<QuangCao>();
				arrV = checkBO.getQuangCao();
				request.setAttribute("arrV", arrV);
				RequestDispatcher rd = request.getRequestDispatcher("QuangCao.jsp");
				rd.forward(request, response);
			}
			
			else if(null != quanlychuatindang)
			{
				HttpSession session = request.getSession();
				
				
				CheckBO checkBO = new CheckBO();
				ArrayList<Tindang> arrTDD = new ArrayList<Tindang>();
				arrTDD = checkBO.getTindadang((String)session.getAttribute("userName"));
				request.setAttribute("arrTDD", arrTDD);
				RequestDispatcher rd = request.getRequestDispatcher("DA_quanlytindadang.jsp");
				rd.forward(request, response);
			}
			
			else if(null != thongke)
			{
			}
			else if(null != quaylai)
			{
				response.sendRedirect("DA_trangcanhan.jsp");
							}
}
}