package aiia.tutorial.mapper;

import java.util.HashMap;
import java.util.List;

public interface CommentMapper {
	List list();
	void post(HashMap params);
	void put(HashMap params);
	void delete(HashMap params);
}
