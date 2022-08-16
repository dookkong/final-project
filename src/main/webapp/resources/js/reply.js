console.log("reply -------!!");
var replyService = (function(){
	function add(reply, callback){
		console.log("replyService add ---------");
		
		$.ajax({
			type:'post',
			url: '/replies/creat',
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf8"
		})
		.done(function(result, status, xhr){
			if(callback){
				callback(result);
			}
		})
		.fail(function(xhr, status, er){
			if(error){
				error(er);
			}
		});
	};
	
	function getList(param, callback, error){
		var bno = param.bno;
		var page = param.page || 1;
		
		console.log("getList bno, page-------"+bno+","+page);
		
		$.getJSON("/replies/pages/"+bno+"/"+page+".json",
		function(data){
			if(callback){
				callback(data.list);
			}
		})
		.fail(funtion(xhr, status, er){
			if(error){
				error(er);
			}
		});
	};
	
	function get(rno, callback, error){
		console.log("get rno-------"+rno);
	
		$.get("/replies/"+rno+".json",
		function(result){
			if(callback){
				callback(result);
			}
		})
		.fail(function(xhr, status, er){
			if(error){
				error(er);
			}
		});
	};
	
	function remove(rno, callback, error){
		console.log("remove rno-------"+rno);
	
		$.ajax({
			type: 'delete',
			url: '/replies/'+rno
		})
		.done(function(deleteResult, status, xhr){
			if(callback){
				callback(deleteResult);
			}
		})
		.fail(function(xhr, status, er){
			if(error){
				error(er);
			}
		});
	};
	
	function update(reply, callback, error){
		console.log("update rno-------"+reply.rno);
		
		$.ajax({
			type: 'put',
			url: '/replies/'+reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8"
		})
		.done(function(result, status, xhr){
			if(callback){
				callback(result);
			}
		})
		.fail(function(xhr, status, er){
			if(error){
				error(er);
			}
		});
	};
	
	function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var dd1 = today.getDate();
		var dd2 = dateObj.getDate();
		
		var str = "";
	}
	
	return{add:add,
		   getList:getList,
		   get:get,
		   remove:remove,
		   update:update,
		   displayTime:displayTime
		   };
})();