package common.util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DAOBase {

	public DAOBase() {
	}



	public SqlSessionFactory getSessionFactory() {
		String resource = "common/config/mybatis-config.xml";
		InputStream is = null;
		try {
			is = Resources.getResourceAsStream(resource);
			SqlSessionFactoryBuilder sb = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = sb.build(is);
			return factory;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
