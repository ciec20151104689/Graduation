<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>个人信息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/toastr.min.css" rel="stylesheet">
    <link href="../css/project.css" rel="stylesheet" >
    <link href="../css/fileinput.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css">
    

    <script src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-datetimepicker.js"></script>
    <script src="../js/bootstrap-datetimepicker.zh-CN.js"></script>

    <!-- 自定义js -->
    <script type="text/javascript" src="../js/content.js"></script>
    <script type="text/javascript" src="../js/toastr.min.js"></script>
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
	<script type="text/javascript" src="../js/fileinput.min.js" ></script>
    <script type="text/javascript" src="../js/zh.min.js" ></script>

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="container-fluid" >
                                    <form role="form" class="form-horizontal">
                                        <div class="col-md-12">
                                            <div class="form-group" style="margin-top: 10px" >
                                                <h3 style="margin-right: 10px" >修改密码</h3>
                                            </div>
                                            <div class="hr-line-dashed"></div>
                                        </div>
                                        <div class="form-group" style="margin-top: 10px" >
                                            <label for="password" class="col-md-1 control-label" >旧密码*</label>
                                            <div class="col-md-10" >
                                                <input class="form-control" type="password" placeholder="请输入旧密码" id="old_password" >
                                            </div>
                                        </div>
                                        <div class="form-group" style="margin-top: 10px" >
                                            <label for="password" class="col-md-1 control-label" >新密码*</label>
                                            <div class="col-md-10" >
                                                <input class="form-control" type="password" placeholder="请输入新密码" id="password" >
                                            </div>
                                        </div>
                                        <div class="form-group" style="margin-top: 10px" >
                                            <label for="_password" class="col-md-1 control-label" >确认密码*</label>
                                            <div class="col-md-10" >
                                                <input class="form-control" type="password" placeholder="请输入确认密码" id="_password" >
                                            </div>
                                        </div>

										<div class="col-md-11">
                                            <div class="form-group" >
                                                <div class="col-md-3 control-label" style="float:right" >
                                                    <button type="button" class="btn btn-primary" id="save" >修改</button>
                                                    <button type="button" class="btn btn-white" style="margin-left: 20px" id="reset" >返回</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    	
        $("#save").on("click",function(){
            if(!$("#save").hasClass("disabled")){
            	var old_password = $("#old_password").val().trim();
                var password = $("#password").val().trim();
                var _password = $("#_password").val().trim();
                if(!old_password){
                    alert("请填写旧密码！");
                    return false;
                }

                if(!password){
                    alert("请填写新密码！");
                    return false;
                }

                if(!_password){
                    alert("请填确认密码！");
                    return false;
                }

                if(password != _password){
                    alert("两次密码不一致！");
                    return false;
                }
                
                $.ajax({
                    type: "post",
                    dataType: "json",
                    url:"/Onlinemusic/user/updatePwd",
                    async:false,
                    data:{
                        oldPwd:old_password,
                        newPwd:password,
                    },
                    success: function (result){
                        if(null != result && "" != result && 0 == result.status){
                            toast("修改成功","添加成功","success");
                            $("#save").addClass("disabled");
                        }else{
                            alert(result.errorMsg);
                        }
                    },
                    error:function (result) {
                        toast("修改失败","修改失败","error");
                    }
                });
            }
        });

        $("#reset").on("click",function(){
        	window.location.href = history.go(-1);
        });

    </script>

</body>

</html>
