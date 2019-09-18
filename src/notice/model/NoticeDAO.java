package notice.model;

import org.apache.ibatis.session.SqlSession;

import common.util.DAOBase;

public class NoticeDAO extends DAOBase{
	private final String NS = "notice.model.NoticeMapper";
	private SqlSession ses;

	public NoticeDAO() {
		
	}
}
