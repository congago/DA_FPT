<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
.tt tr td {
	padding-top: 10px;
	padding: 10px 10px;
	font-size: 16pt;
}

.sub {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 150px;
	font-size: 14pt;
	background-color: green;
	color: white;
	height: 35px;
}

.text {
	font-size: 14pt;
}

.loi {
	color: red;
}

.content {
	padding-top: 10px;
	padding-bottom: 20px;
	background-image: url(images/default.png);
	width: 100%;
}

#main {
	padding-left: 5%;
}

.red {
  color: red !important;
}
</style>
</head>
<script type="text/javascript">
	function KiemTra() {

		var frm = document.forms["dangtin"];

		//---------
		var chuyenmuc = frm["chuyenmuc"].value;
		if (chuyenmuc == "cmuc") {
			document.getElementById("loi-chuyenmuc").innerHTML = "Vui lòng chọn chuyên mục";
			return false;
		} else {
			document.getElementById("loi-chuyenmuc").innerHTML = "";
		}
		
		//---------
		var chuyenmuc = frm["vung"].value;
		if (chuyenmuc == "ivung") {
			document.getElementById("loi-vung").innerHTML = "Vui lòng chọn vùng";
			return false;
		} else {
			document.getElementById("loi-vung").innerHTML = "";
		}
		//-----------
		var tieude = frm["tieude"].value;
		if (tieude == "") {
			document.getElementById("loi-tieude").innerHTML = "Điền tiêu đề rao";
			return false;
		} else {
			if(tieude.length > 20){
				document.getElementById("loi-tieude").innerHTML = "Yêu cầu nhập dưới 20 kí tự";
				return false;
			}
			
			document.getElementById("loi-tieude").innerHTML = "";
		}

		//---------
		var noidung = frm["noidung"].value;
		if (noidung == "") {
			document.getElementById("loi-noidung").innerHTML = "Điền nội dung nội dung";
			return false;
		} else {
			if(noidung.length < 6){
				document.getElementById("loi-noidung").innerHTML = "Yêu cầu nhập tối thiểu 6 kí tự";
				return false;
			}
			document.getElementById("loi-noidung").innerHTML = "";
		}
		//-----------

		//---------
		var sdt = frm["sdt"].value;
		if (sdt == "") {
			document.getElementById("loi-sdt").innerHTML = "Điền số điện thoại";
			return false;
		} else {
			if (isNaN(sdt)) {
				document.getElementById("loi-sdt").innerHTML = "Nhập sai, nhập lại số điện thoại";
				return false;
			}
			document.getElementById("loi-sdt").innerHTML = "";
		}
		//-----------
		
		
		var gia = frm["gia"].value;
		if (gia == "") {
			document.getElementById("loi-gia").innerHTML = "Điền giá tiền";
			return false;
		} else {
			if (isNaN(gia)) {
				document.getElementById("loi-gia").innerHTML = "Nhập sai, nhập lại giá tiền";
				return false;
			} else {
				if((Integer.parseInt(gia)) > 1000){
					document.getElementById("loi-gia").innerHTML = "Giá tiền tối thiểu là 1000VND";
					return false;
				}
			}
			document.getElementById("loi-gia").innerHTML = "";
		}
		
		
		
		return true;
	}
</script>
<body>

	<% String a =(String)session.getAttribute("userName");%>
	<div id="main">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="head-link" align="center">
			<ul>
				<li><a href="ShowTrangChu?">Trang chủ</a></li>
				<li><a href="DA_showdangtin?">>Đăng tin</a></li>

			</ul>
		</div>
		<div class="content" align="center">
			<h2>Đăng tin rao vặt</h2>
			<form action="DA_checkdangtin" method="post" name="dangtin"
				onsubmit="return KiemTra();" enctype="multipart/form-data"  accept-charset="UTF-8">
				<table class="tt">
					<tr>
						<td>Chuyên mục<b class="red">*</b>
						</td>
						<td><select name="chuyenmuc" class="text" id="tg">

								<option value="cmuc" selected="selected">«Chọn danh
									mục»</option>

								<option value="Xe cộ"
									style="background-color: #dcdcc3; font-weight: bold;"
									disabled="disabled">-- Xe cộ --</option>

								<option value="Xe máy">Xe máy</option>

								<option value="Ô tô">Ô tô</option>

								<option value="Xe đạp">Xe đạp</option>

								<option value="Xe tải">Xe tải</option>

								<option value="Khác">Khác</option>

								<option value="batdongsan"
									style="background-color: #dcdcc3; font-weight: bold;"
									disabled="disabled">-- Bất động sản --</option>

								<option value="Căn hộ/Chung cư">Căn hộ/Chung cư</option>

								<option value="Nhà ở">Nhà ở</option>

								<option value="Đất">Đất</option>

								<option value="Văn phòng, Mặt bằng kinh
									doanh">Văn phòng, Mặt bằng kinh
									doanh</option>

								<option value="Phòng trọ">Phòng trọ</option>

								<option value="Đồ điện tử"
									style="background-color: #dcdcc3; font-weight: bold;"
									disabled="disabled">-- Đồ điện tử --</option>

								<option value="Điện thoại di động">Điện thoại di động</option>

								<option value="Máy tính bảng">Máy tính bảng</option>

								<option value="Máy tính, Laptop">Máy tính, Laptop</option>

								<option value="Máy ảnh, Máy quay">Máy ảnh, Máy quay</option>

								<option value="Tivi, Loa, Amply,...">Tivi, Loa, Amply, Máy nghe nhạc</option>

								<option value="Phụ kiện, Linh kiện">Phụ kiện, Linh kiện</option>


								<option value="vat dung gia dinh"
									style="background-color: #dcdcc3; font-weight: bold;"
									disabled="disabled">-- Vật dụng gia đình --</option>

								<option value="Tủ lạnh, Máy lạnh,...">Tủ lạnh, Máy lạnh, Máy giặt</option>

								<option value="Nội ngoại thất, Cây cảnh">Nội ngoại thất, Cây cảnh</option>

								<option value="Đồ gia dụng gia đình khác">Đồ gia dụng gia đình khác</option>


								<option value="icacloaikhac"
									style="background-color: #dcdcc3; font-weight: bold;"
									disabled="disabled">-- Các loại khác --</option>

								<option value="Các loại khác">Các loại khác</option>

						</select> <span id="loi-chuyenmuc" class="loi"></span></td>
					</tr>
					<tr>

						<td>Vùng<b class="red">*</b>
						</td>
						<td><select style="width: 300px" name="vung" class="text"
							id="tg" onchange="myFunction()">
								<option value="ivung" selected="selected">«Chọn vùng»</option>



								<option value="Quận hải châu">Quận Hải Châu</option>

								<option value="Quận Thanh Khê">Quận Thanh Khê</option>

								<option value="Quận Sơn Trà">Quận Sơn Trà</option>

								<option value="Quận Ngũ Hành Sơn">Quận Ngũ Hành Sơn</option>

								<option value="QuậnLiên Chiểu">QuậnLiên Chiểu</option>

								<option value="Quận Cẩm Lệ">Quận Cẩm Lệ</option>

						</select> <span id="loi-vung" class="loi"></span></td>
					</tr>



					<tr>
						<td>Bạn là <b class="red">*</b>
						</td>
						<td><input name="banla" type="radio" value="Ca nhan"
							checked="checked" />Cá nhân <input name="banla" type="radio"
							value="Cong ty" />Công ty</td>
					</tr>
					<tr>
						<td>Bạn đăng tin <b class="red">*</b>
						</td>
						<td><input name="bdangtin" type="radio" value="can ban"
							checked="checked" />Cần bán <input name="bdangtin" type="radio"
							value="can mua" />Cần mua</td>
					</tr>
					<tr>
						<td>Tiêu đề rao<b class="red">*</b>
						</td>
						<td><input style="width: 300px" type="text" name="tieude"
							class="text"> <span id="loi-tieude" class="loi"></span></td>
					</tr>
					<tr>

						<td>Nội dung<b class="red">*</b></td>
						<td><textarea name="noidung" rows="5" cols="39"
								placeholder="Đây là vùng nhập text" maxlength="254"></textarea> <span
							id="loi-noidung" class="loi"></span></td>
					</tr>

					<tr>
						<td>Giá tiền<b class="red">*</b></td>
						<td><input style="width: 300px" type="text" name="gia"
							class="text">VND <span id="loi-gia" class="loi"></span></td>
					</tr>
					<tr>
						<td>Ảnh<b class="red">*</b></td>
						<td><input type="file" name="fileToUpload" id="fileToUpload"></td>
					</tr>
				</table>
				<input type="submit" value="Đăng tin" class="sub">
			</form>
		</div>
		<jsp:include page="footter.jsp"></jsp:include>
	</div>
</body>
</html>