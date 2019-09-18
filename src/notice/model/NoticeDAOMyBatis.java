package notice.model;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class NoticeDAOMyBatis {

	private final String NS="notice.model.NoticeMapper"; //NS=namespace
	//NoticeMapper.xml�� ����Ǿ� �ִ� namespace�� NS����� �Ҵ��Ѵ�.(�ʼ��������ؾ���)
	private SqlSession ses;
	
	public NoticeDAOMyBatis() {
		
	}
	
	public SqlSessionFactory getSessionFactory() {
		String resource="common/config/mybatis-config.xml";//���赵 (���ϰ��)
		InputStream is=null;
		try {
			is=Resources.getResourceAsStream(resource); //��忬���� ��Ʈ����ȯ
			SqlSessionFactoryBuilder sb=new SqlSessionFactoryBuilder();//���డ	
			SqlSessionFactory factory=sb.build(is);
			//���డ�� ���������µ� ���赵�� �ʿ��� ���������� SqlSession(���忡�� ���� ��ǰ)�� �����µ� �°� jdbc����
			return factory;
		}catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}//------------------------------------------------------
	
	public int getCount() {
		try {
		ses=this.getSessionFactory().openSession(); //���� ������
		int cnt=ses.selectOne(NS+".tabCount");
		return cnt;//Session������ �ݾ��ֱ�
		}finally {
			if(ses!=null)ses.close();
		}
	}//-------------------------------------

	//public int insertNotice(NoticeVO notice,FileInfoVO fileinfo) {
		public int insertNotice(NoticeVO notice) {
		try {
			ses=this.getSessionFactory().openSession();//����Ʈ�� auto commit�� �ƴ�
			int n=ses.insert(NS+".insertNotice", notice);
			if(n>0) {
				ses.commit();
			}else {
				ses.rollback();
			}
			return n;
		}finally {
			if(ses!=null)ses.close();
		}
	}//--------------------
		//public int insertNotice(NoticeVO notice,FileInfoVO fileinfo) {
		public int insertFileInfo(FileInfoVO fileinfo) {
		try {
			ses=this.getSessionFactory().openSession();//����Ʈ�� auto commit�� �ƴ�
			int n=ses.insert(NS+".insertFileInfo", fileinfo);
			if(n>0) {
				ses.commit();
			}else {
				ses.rollback();
			}
			return n;
		}finally {
			if(ses!=null)ses.close();
		}
	}//--------------------	
		public int insert(NoticeVO notice,FileInfoVO fileinfo) {
			try {
				ses=this.getSessionFactory().openSession();
				int n=ses.insert(NS+".insertNotice", notice);
				
				if(n>0) {
					ses.commit();
					System.out.println("nnum====>"+notice.getNnum());
					fileinfo.setNotice_nnum(notice.getNnum());
					System.out.println("fname=="+fileinfo.getFname());
					if(fileinfo.getFname()!=null) {
						int n2=ses.insert(NS+".insertFileInfo", fileinfo);
						System.out.println("fileinfo  fnum===="+fileinfo.getFnum());
						if(n2>0) {
							ses.commit();							
						}
					}
				}else {
					ses.rollback();
				}
				return n;
				
			}finally {
				if(ses!=null)ses.close();
			}
		}
		
	//�� �Խñ� �� ��������
	public int getTotalCount() {
		try {
			ses=this.getSessionFactory().openSession(true);
			int total=ses.selectOne(NS+".getTotalCount");
			return total;
		}finally {
			close();
		}
	}//--------------------------------

	public List<NoticeVO> listNotice(Map<String,String> map) {
		try {
			ses=this.getSessionFactory().openSession();
			
			/*������ ���� 2�� �̻��� ����
			 * �Ķ���ͷ� map �Ǵ� VO��ü�� ����
			 * */
			List<NoticeVO> arr=ses.selectList(NS+".listNotice", map);
			//db���̺��� �÷���� VO�� ������Ƽ���� ��ġ�ؾ� �˾Ƽ� �����ͼ� VO�� set����
			//mybatis�� �Ķ���� �ϳ��� �ѱ�� �־ �ΰ��̻��϶��� map�� �̿��ؼ� �Ѱܾ���
			return arr;
		}finally {
			if(ses!=null)ses.close();
		}
	}//--------------------------------------
	private void close() {
		if(ses!=null)ses.close();
	}
	
	public boolean updateReadnum(String idx) {
		try {
			ses=this.getSessionFactory().openSession(true);
			int n=ses.update(NS+".updateReadnum",idx);
			return (n>0)?true:false;
		}finally {
			close();
		}
	}
	public NoticeVO getNotice(String nnum) {
		try {
			ses=this.getSessionFactory().openSession(true);
			//PK�� �������� ������ ����� ���ڵ� 1��
			NoticeVO notice=ses.selectOne(NS+".getNotice",nnum);
			return notice;
		}finally {
			close();
		}
	}//----------------------------------------------
	public FileInfoVO getFileInfo(String fnum) {
		try {
			ses=this.getSessionFactory().openSession(true);
			//PK�� �������� ������ ����� ���ڵ� 1��
			FileInfoVO fileInfo=ses.selectOne(NS+".getFileInfo",fnum);
			return fileInfo;
		}finally {
			close();
		}
	}//----------------------------------------------
	
	public List<FileInfoVO> getFileList(String nnum) {
		try {
			ses=this.getSessionFactory().openSession(true);
			//PK�� �������� ������ ����� ���ڵ� 1��
			List<FileInfoVO> fileInfo=ses.selectList(NS+".getFileList",nnum);
			return fileInfo;
		}finally {
			close();
		}
	}//----------------------------------------------
	
	public int deleteNotice(String nnum) {
		try {
			ses=this.getSessionFactory().openSession(true);
			int n=ses.delete(NS+".deleteNotice",nnum);
			return n;
	}finally {
		close();
		}
	}
	
	public int deleteFileinfo(String nnum) {
		try {
			ses=this.getSessionFactory().openSession(true);
			int n=ses.delete(NS+".deleteFileInfo",nnum);
			return n;
	}finally {
		close();
		}
	}
	
	public int delete(NoticeVO notice) {
		try {
			int r=this.deleteFileinfo(notice.getNnum());
			System.out.println("r==="+r);
			ses=this.getSessionFactory().openSession(true);
			int n=ses.delete(NS+".deleteNotice", notice);				
			return n;
		}finally {
			close();
		}
	}
	public int updateNotice(NoticeVO notice) {
		try {
			ses=this.getSessionFactory().openSession(true);
			int n=ses.update(NS+".updateNotice", notice);
			return n;
		}finally {
		close();
		}
	}//--------------------------
	
	public int updateFileInfo(FileInfoVO fileinfo) {
		try {
			ses=this.getSessionFactory().openSession(true);
			int n=ses.update(NS+".updateFileInfo", fileinfo);
			return n;
		}finally {
		close();
		}
	}//--------------------------
	public int update(NoticeVO notice,FileInfoVO fileinfo) {
		try {
			ses=this.getSessionFactory().openSession(true);
			int n=ses.update(NS+".updateNotice",notice);
			if(n>0) {
				ses.commit();
			}
			int n2=ses.update(NS+".updateFileInfo", fileinfo);
			if(n2>0) {
				ses.commit();
			}
			return n;
		}finally {
			close();
		}
	}
	



}
