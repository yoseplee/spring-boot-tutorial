<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post">
		<fieldset><legend>코멘트 등록</legend>
			<input type="hidden" name="method" value="post" />
			<input type="text" name="writer" size="10" />
			<input type="text" name="content" size="40" />
			<button type="submit">전송</button>
		</fieldset>
	</form>
	<form action="" method="post">
		<fieldset><legend>코멘트 수정</legend>
			<input type="hidden" name="method" value="put" />
			<input type="text" name="idx" size="10" />
			<input type="text" name="writer" size="10" />
			<input type="text" name="content" size="40" />
			<button type="submit">전송</button>
		</fieldset>
	</form>
	<form action="" method="post">
		<fieldset><legend>코멘트 삭제</legend>
			<input type="hidden" name="method" value="delete" />
			<input type="text" name="idx" size="10" />
			<button type="submit">전송</button>
		</fieldset>
	</form>
	<ul id="comment-list"></ul>
	<script>
		const getList = () => {
			const target = document.querySelector('#comment-list')
			fetch("/api/comment").then(res => res.json()).then(data => {
				let html = ''
				data.forEach(v => {
					html += `<li>\${v.idx} / \${v.writer} / \${v.content} / \${v.reg_date}</li>`
				})
				document.querySelector('#comment-list').innerHTML = html
			})
		}
		
		Array.prototype.forEach.call(document.forms, v => {
			v.onsubmit = e => {
				e.preventDefault()
				const frm = e.target
				const method = frm.method.value
				const headers = { "Content-type": "application/json; charset=utf-8" }
				let params = {}
				switch (method) {
					case 'post' :
						data = {
							writer: frm.writer.value,
							content: frm.content.value
						}
					break
					case 'put' :
						data = {
							idx: frm.idx.value,
							writer: frm.writer.value,
							content: frm.content.value
						}
					break
					case 'delete' :
						data = { idx: frm.idx.value }
					break
				}
				frm.reset()
				fetch('/api/comment', { method, headers, body: JSON.stringify(data) }).then(res => {
					if (res.ok) getList()
				})
			}
		})
		
		getList()
	</script>
</body>
</html>