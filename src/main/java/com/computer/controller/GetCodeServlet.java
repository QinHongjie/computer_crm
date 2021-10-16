package com.computer.controller;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

/**
 * Servlet implementation class GetCodeServlet
 */
@WebServlet("/GetCodeServlet")
public class GetCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	  //验证码的宽、高
	  private static int WIDTH=80;
	  private static int HEIGHT=25;
	  //绘制背景
	  private void drawBg(Graphics g){
	    //rgb
	    g.setColor(new Color(0, 239, 242));
	    //绘制矩形。x,y,wigth,height
	    g.fillRect(0,0,WIDTH,HEIGHT);
	    //随机绘制100个干扰点
	    Random random=new Random();
	    for (int i=0;i<100;i++){
	      //产生(0,1）上的小数，*WIDTH|HEIGHT，再取整也行
	      int x=random.nextInt(WIDTH);
	      int y=random.nextInt(HEIGHT);
	      g.drawOval(x,y,1,1);
	      //干扰点的颜色也可以随机，随机产生red，green，blue即可
	      //g.setColor(new Color(red,green,blue));
	    }
	  }
	  //绘制验证码
	  private void drawCode(Graphics g,char[] code){
	    g.setColor(Color.BLACK);
	    //字体、样式（多个时竖线分隔）、字号
	    g.setFont(new Font("serif",Font.ITALIC|Font.BOLD,18));
	    //在不同位置绘制验证码字符，参数：要绘制的String、横、纵坐标。+""是为了char转String。
	    g.drawString(code[0]+"",1,17);
	    g.drawString(code[1]+"",16,15);
	    g.drawString(code[2]+"",31,18);
	    g.drawString(code[3]+"",46,16);
	  }
	  //随机产生4位验证码
	  private char[] getCode(){
	    String chars="23456789QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjkzxcvbnm";
	    char[] code=new char[4];
	    Random random=new Random();
	    for (int i=0;i<4;i++){
	      //[0,62)
	      int index= random.nextInt(62);
	      code[i]=chars.charAt(index);
	    }
	    return code;
	  }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    HttpSession session = request.getSession();
	    ServletOutputStream sos = response.getOutputStream();
	    response.setContentType("image/jpeg");
	    //设置浏览器不缓存此图片
	    response.setHeader("Pragma","No-cache");
	    response.setHeader("Cache-Control","no-cache");
	    response.setDateHeader("Expires",0);
	    //创建内存图片
	    BufferedImage bufferedImage = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
	    Graphics g= bufferedImage.getGraphics();
	    char[] code=getCode();
	    //将验证码放到session域中。session对象要在提交响应之前获得
	    session.setAttribute("code",new String(code));
	    drawBg(g);
	    drawCode(g,code);
	    g.dispose();
	    //将图片输出到浏览器
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    ImageIO.write(bufferedImage,"JPEG",baos);
	    baos.writeTo(sos);
	    baos.close();
	    sos.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
