package cn.ems.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;


public class CharactorFilter implements Filter{
	String encoding = null;
	public CharactorFilter(){}
	/*销毁方法*/
	public void destroy() {
		encoding = null;
	}
	/*过滤处理方法*/
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if(encoding != null){
			request.setCharacterEncoding(encoding);
			//设置response字符编码
			response.setContentType("text/html;charset="+encoding);
		}
		chain.doFilter(request, response); //传递给下一个过滤器
	}
	/*初始化方法*/
	public void init(FilterConfig filterConfig) throws ServletException {
		encoding = filterConfig.getInitParameter("encoding"); //获取初始化参数
	}
}
