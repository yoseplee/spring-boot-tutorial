package aiia.tutorial.Controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import aiia.tutorial.mapper.CommentMapper;

@RestController
public class HomeController {
	
	@Resource
	CommentMapper commentMapper;
	
	@GetMapping(value="/api/comment")
	public List getList () {
		List commentList = commentMapper.list();
		return commentList;
	}
	
	@PostMapping(value="/api/comment", consumes = {"application/json"})
	public HashMap post (@RequestBody HashMap params) {
		HashMap obj = new HashMap();
		Boolean success = true;
		try {
			commentMapper.post(params);
		} catch (Exception e) {
			success = false;
			obj.put("err", e);
		}
		obj.put("success", success);
		return obj;
	}
	
	@PutMapping(value="/api/comment", consumes = {"application/json"})
	public HashMap put (@RequestBody HashMap params) {
		HashMap obj = new HashMap();
		Boolean success = true;
		try {
			commentMapper.put(params);
		} catch (Exception e) {
			success = false;
			obj.put("err", e);
		}
		obj.put("success", success);
		return obj;
	}
	
	@DeleteMapping(value="/api/comment", consumes = {"application/json"})
	public HashMap delete (@RequestBody HashMap params) {
		HashMap obj = new HashMap();
		Boolean success = true;
		try {
			commentMapper.delete(params);
		} catch (Exception e) {
			success = false;
			obj.put("err", e);
		}
		obj.put("success", success);
		return obj;
	}
	
}
