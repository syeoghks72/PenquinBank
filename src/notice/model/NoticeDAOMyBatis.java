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
	//NoticeMapper.xml에 기술되어 있는 namespace를 NS상수에 할당한다.(필수적으로해야함)
	private SqlSession ses;
	
	public NoticeDAOMyBatis() {
		
	}
	
	public SqlSessionFactory getSessionFactory() {
		String resource="common/config/mybatis-config.xml";//설계도 (파일경로)
		InputStream is=null;
		try {
			is=Resources.getResourceAsStream(resource); //노드연결한 스트림반환
			SqlSessionFactoryBuilder sb=new SqlSessionFactoryBuilder();//건축가	
			SqlSessionFactory factory=sb.build(is);
			//건축가가 공장을짓는데 설계도가 필요함 공장을통해 SqlSession(공장에서 만든 제품)을 얻어오는데 걔가 jdbc해줌
			return factory;
		}catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}//------------------------------------------------------
	
	public int getCount() {
		try {
		ses=this.getSessionFactory().openSession(); //공장 얻어오기
		int cnt=ses.selectOne(NS+".tabCount");
		return cnt;//Session쓰고나면 닫아주기
		}finally {
			if(ses!=null)ses.close();
		}
	}//-------------------------------------

	//public int insertNotice(NoticeVO notice,FileInfoVO fileinfo) {
		public int insertNotice(NoticeVO notice) {
		try {
			ses=this.getSessionFactory().openSession();//디폴트가 auto commit이 아님
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
			ses=this.getSessionFactory().openSession();//디폴트가 auto commit이 아님
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
		
	//총 게시글 수 가져오기
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
			
			/*전달할 값이 2개 이상일 때는
			 * 파라미터로 map 또는 VO객체를 전달
			 * */
			List<NoticeVO> arr=ses.selectList(NS+".listNotice", map);
			//db테이블의 컬럼명과 VO의 프로퍼티명이 일치해야 알아서 가져와서 VO에 set해줌
			//mybatis는 파라미터 하나만 넘길수 있어서 두개이상일때는 map을 이용해서 넘겨야함
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
			//PK로 가져오기 때문에 결과는 레코드 1개
			NoticeVO notice=ses.selectOne(NS+".getNotice",nnum);
			return notice;
		}finally {
			close();
		}
	}//----------------------------------------------
	public FileInfoVO getFileInfo(String fnum) {
		try {
			ses=this.getSessionFactory().openSession(true);
			//PK로 가져오기 때문에 결과는 레코드 1개
			FileInfoVO fileInfo=ses.selectOne(NS+".getFileInfo",fnum);
			return fileInfo;
		}finally {
			close();
		}
	}//----------------------------------------------
	
	public List<FileInfoVO> getFileList(String nnum) {
		try {
			ses=this.getSessionFactory().openSession(true);
			//PK로 가져오기 때문에 결과는 레코드 1개
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
