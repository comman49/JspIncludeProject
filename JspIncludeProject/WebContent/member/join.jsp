<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>One Column - Halcyonic by HTML5 UP</title>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.min.css'>
<meta charset="euc-kr" />
<style>
.row {
	margin: 0px auto;
	width: 600px;
}
h2,h3 {
	text-align: center;
}
</style>
</head>
<body class="subpage">
		<div id="content-wrapper">
			<div id="content">
				<div class="container">
					<div class="row">
						<div class="12u">

							<!-- Main Content -->
							<section> 
							<header>
							<h2>ȸ������</h2>
							<h3>
								<font color=red>*</font>�� �ʼ� �Է� ����
							</h3>
							</header> 
							<!-- �Է� �� -->
							<table class='table'>
								<tr>
									<th width=20% class='text-right success'>ID</th>
									<td width=80% class='text-left'>
										<input type=text name=id size=12 readonly>
										<input type=button class='btn btn-sm btn-danger' value='�ߺ�üũ'>
									</td>
								</tr>
								
								<tr>
									<th width=20% class='text-right success'>��й�ȣ</th>
									<td width=80% class='text-left'>
										<input type=password name=pwd size=12>
										<input type=password name=pwd1 size=12 placeholder='���Է�'>
									</td>
								</tr>
								
								<tr>
									<th width=20% class='text-right success'>�̸�</th>
									<td width=80% class='text-left'>
										<input type=text name=name size=12>
									</td>
								</tr>
								
								<tr>
									<th width=20% class='text-right success'>����</th>
									<td width=80% class='text-left'>
										<input type=radio name=sex value='����'>����
										<input type=radio name=sex value='����'>����
									</td>
								</tr>
								
								<tr>
									<th width=20% class='text-right success'>�������</th>
									<td width=80% class='text-left'>
										<input type=date name=birth size=20>
									</td>
								</tr>
								<!-- �̸��� ������ : javaMail �̿� -->
								<tr>
									<th width=20% class='text-right success'>�̸���</th>
									<td width=80% class='text-left'>
										<input type=text name=email size=40>
									</td>
								</tr>
								
								<tr>
									<th width=20% class='text-right success'>�����ȣ</th>
									<td width=80% class='text-left'>
										<input type=text name=post1 size=3 readonly> -
										<input type=text name=post2 size=3 readonly>
										<input type=button value='�����ȣ �˻�' class='btn btn-sm btn-danger'>
									</td>
								</tr>
								
								<tr>
									<th width=20% class='text-right success'>�ּ�</th>
									<td width=80% class='text-left'>
										<input type=text name=addr1 size=40 readonly>
									</td>
								</tr>
								
								<tr>
									<th width=20% class='text-right success'>���ּ�</th>
									<td width=80% class='text-left'>
										<input type=text name=addr2 size=40>
									</td>
								</tr>
								
								<tr>
									<th width=20% class='text-right success'>��ȭ��ȣ</th>
									<td width=80% class='text-left'>
										<select name=tel1>
											<option>02</option>
											<option>031</option>
											<option>032</option>
											<option>053</option>
											<option>041</option>
										</select>
										<input type=text name=tel2 size=7> - 
										<input type=text name=tel3 size=10>
									</td>
								</tr>
								
								<tr>
									<td colspan=2 class='text-center'>
										<input type=submit class='btn btn-sm btn-info' value='����'>
										<input type=button class='btn btn-sm btn-waning' value='���'>
									</td>
								</tr>
								
								
							</table>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>