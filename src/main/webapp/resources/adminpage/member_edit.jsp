

<%@page import="mybatis.QBoardDTO"%>
<%@page import="mybatis.QBoardDAO"%>
<%@page import="board.MBoardDTO"%>
<%@page import="board.MBoardDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
 
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num"); //게시물의 일련번호
String flag = request.getParameter("flag"); 
MBoardDAO dao = new MBoardDAO(application); //DB연결
QBoardDAO qdao = new QBoardDAO(application);
MBoardDTO dto = dao.selectView(num); //게시물 조회
QBoardDTO qdto = qdao.selectView(num); //게시물 조회
//세션영역에 저장된 회원 아이디를 얻어와서 문자열의 형태로 변환
//String sessionId = session.getAttribute("UserId").toString();

dao.close();
qdao.close();
%> 

<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
    
}
</script>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

</head>

<body id="page-top">
	<% 
	if(session.getAttribute("Id") == null  || !(session.getAttribute("UserStatus").equals(0)))  {%>
	<script>
		alert('관리자 계정 로그인후에 작성가능합니다.');location.href="logout.jsp";
	</script>
	<%
	}
	%>
    <!-- Page Wrapper -->
    <div id="wrapper">

       <%@ include file="./commons/left.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				<%@ include file="./commons/top.jsp" %>
                <!-- Topbar -->
                
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                	
                    <h1 class="h3 mb-2 text-gray-800">게시글 수정</h1>
                    <p class="mb-4">게시글을 수정합니다. </p>
		
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">게시판관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
 								<form name="writeFrm" method="post" action="mEditProcess.jsp"
								onsubmit="return validateForm(this);">
								<!-- 히든으로 값 전송 -->
								<input type="hidden" name="num" value="<%=num %>" />
								<input type="hidden" name="flag" value="<%=flag %>" />
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <colgroup>
									<col width="20%"/>
										
									</colgroup>
                                    <tbody>
                                    
                                    <%
				                    if(flag.equals("notice")) {
				                    %>					
									<tr>
										<th class="text-center" 
											style="vertical-align:middle;">제목</th>
										<td>
											<input type="text" name="title" class="form-control" 
											value=<%= dto.getMboard_title() %> />
										</td>
									</tr>
									<tr>
										<th class="text-center" 
											style="vertical-align:middle;">내용</th>
										<td>
											<textarea name="content" rows="10" class="form-control"><%= dto.getMboard_content() %></textarea>
										</td>
									</tr>
									<%
				                    }
				                    else if(flag.equals("qna")) {
									%>
									<tr>
										<th class="text-center" 
											style="vertical-align:middle;">제목</th>
										<td>
											<input type="text" name="title" class="form-control" 
											value=<%= qdto.getTitle() %> />
										</td>
									</tr>
									<tr>
										<th class="text-center" 
											style="vertical-align:middle;">내용</th>
										<td>
											<textarea name="content" rows="10" class="form-control"><%= qdto.getContent() %></textarea>
										</td>
									</tr>
									<%
				                    }
									%>
								</tbody>
                                </table>    
                               <div class="col d-flex justify-content-end" style="">
									<!-- 각종 버튼 부분 -->								
									<button type="submit" class="btn btn-primary">작성완료</button>
									<button type="reset" class="btn btn-danger">Reset</button>
									<button type="button" class="btn btn-warning" onclick="location.href='member_list.jsp?flag=<%=flag%>';">리스트보기</button>
								</div>    
								</form>   
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.jsp">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>

</html>