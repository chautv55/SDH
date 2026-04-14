<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="LVDT2_1.aspx.cs" Inherits="SDH_VICTORY.LVDT2_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card border-primary">
        <div class="card-body">
            <div class="container">
                <h2 class="mb-4">Phiếu đăng ký dự tuyển trình độ thạc sĩ</h2>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="HoTen">Họ và tên học viên<span class="auto-style1">*</span></label>
                            <asp:TextBox ID="HoTen" runat="server" required="true" CssClass="form-control" placeholder="Nhập Họ và tên"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="CCCD">Số CCCD<span class="auto-style1">*</span></label>
                            <asp:TextBox ID="CCCD" runat="server" required="true" CssClass="form-control" placeholder="Nhập Số CCCD"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="NgayCapCCCD">Ngày cấp CCCD<span class="auto-style1">*</span></label>
                            <asp:TextBox ID="NgayCapCCCD" required="true" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="DienThoai">Điện thoại<label for="HoTen"><span class="auto-style1">*</span></label></label>
                            <asp:TextBox ID="DienThoai" required="true" runat="server" CssClass="form-control" placeholder="Nhập Điện thoại"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="Email">Email<label for="HoTen"><span class="auto-style1">*</span></label></label>
                            <asp:TextBox ID="Email" required="true" runat="server" CssClass="form-control" placeholder="Nhập Email" TextMode="Email"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Nganh">Ngành<label for="HoTen"><span class="auto-style1">*</span></label></label>
                    <asp:TextBox ID="Nganh" required="true" runat="server" CssClass="form-control" placeholder="Nhập Ngành"></asp:TextBox>
                </div>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="GioiTinh">Giới tính<span class="auto-style1">*</span></label>
                            <asp:DropDownList ID="GioiTinh" required="true" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Nam" Value="Nam"></asp:ListItem>
                                <asp:ListItem Text="Nữ" Value="Nữ"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="NgaySinh">Ngày sinh</label><span class="auto-style1">*</span>
                            <asp:TextBox ID="NgaySinh" required="true" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="NoiSinh">Nơi sinh<span class="auto-style1">*</span></label>
                            <asp:TextBox ID="NoiSinh" required="true" runat="server" CssClass="form-control" placeholder="Nhập Nơi sinh"></asp:TextBox>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="DanToc">Dân tộc<span class="auto-style1">*</span></label>
                            <asp:TextBox ID="DanToc" required="true" runat="server" CssClass="form-control" placeholder="Nhập Dân tộc"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="TonGiao">Tôn giáo</label>
                            <asp:TextBox ID="TonGiao" runat="server" CssClass="form-control" placeholder="Nhập Tôn giáo"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-lg">
                        <div class="form-group">
                            <label for="ChinhSach">Diện chính sách</label>
                            <asp:TextBox ID="ChinhSach" runat="server" CssClass="form-control" placeholder="Nhập Diện chính sách"></asp:TextBox>
                        </div>
                    </div>
                </div>




                <div class="form-group">
                    <label for="HoKhau">Hộ khẩu thường trú<label for="HoTen"><span class="auto-style1">*</span></label></label>
                    <asp:TextBox ID="HoKhau" runat="server" CssClass="form-control" required="true" TextMode="MultiLine" Rows="3" placeholder="Nhập Hộ khẩu thường trú"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="DiaChiTamTru">Địa chỉ tạm trú<label for="HoTen"><span class="auto-style1">*</span></label></label>
                    <asp:TextBox ID="DiaChiTamTru" runat="server" CssClass="form-control" required="true" TextMode="MultiLine" Rows="3" placeholder="Nhập Địa chỉ tạm trú"></asp:TextBox>
                </div>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="CongViec">Công việc hiện nay<label for="HoTen"><span class="auto-style1">*</span></label></label>
                            <asp:TextBox ID="CongViec" required="true" runat="server" CssClass="form-control" placeholder="Nhập Công việc hiện nay"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="ChucVu">Chức vụ<label for="HoTen"><span class="auto-style1">*</span></label></label>
                            <asp:TextBox ID="ChucVu" required="true" runat="server" CssClass="form-control" placeholder="Nhập Chức vụ"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="DonViCongTac">Đơn vị công tác<label for="HoTen"><span class="auto-style1">*</span></label></label>
                            <asp:TextBox ID="DonViCongTac" required="true" runat="server" CssClass="form-control" placeholder="Nhập Đơn vị công tác"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="DiaChiLienLac">Địa chỉ liên lạc khi cần<label for="HoTen"><span class="auto-style1">*</span></label></label>
                    <asp:TextBox ID="DiaChiLienLac" runat="server" required="true" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Nhập Địa chỉ liên lạc"></asp:TextBox>
                </div>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="TotNghiep">Tốt nghiệp đại học ngành<label for="HoTen"><span class="auto-style1">*</span></label></label>
                            <asp:TextBox ID="TotNghiep" runat="server" required="true" CssClass="form-control" placeholder="Nhập Ngành tốt nghiệp đại học"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="ChuyenNganh">Chuyên ngành<label for="HoTen"><span class="auto-style1">*</span></label></label>
                            <asp:TextBox ID="ChuyenNganh" required="true" runat="server" CssClass="form-control" placeholder="Nhập Chuyên ngành"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="KhenThuongKyLuat">Khen thưởng </label>
                            <asp:TextBox ID="KhenThuong" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Nhập Khen thưởng "></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="KhenThuongKyLuat">Kỷ luật</label>
                            <asp:TextBox ID="KyLuat" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Nhập kỷ luật"></asp:TextBox>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="HoTenCha">Họ và tên cha</label>
                            <asp:TextBox ID="HoTenCha" runat="server" CssClass="form-control" placeholder="Nhập Họ và tên cha"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="DanTocCha">Dân tộc cha</label>
                            <asp:TextBox ID="DanTocCha" runat="server" CssClass="form-control" placeholder="Nhập Dân tộc cha"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="NamSinhCha">Năm sinh cha</label>
                            <asp:TextBox ID="NamSinhCha" runat="server" CssClass="form-control" placeholder="Nhập Năm sinh cha" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="HoTenMe">Họ và tên mẹ</label>
                            <asp:TextBox ID="HoTenMe" runat="server" CssClass="form-control" placeholder="Nhập Họ và tên mẹ"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="DanTocMe">Dân tộc mẹ</label>
                            <asp:TextBox ID="DanTocMe" runat="server" CssClass="form-control" placeholder="Nhập Dân tộc mẹ"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="NamSinhMe">Năm sinh mẹ</label>
                            <asp:TextBox ID="NamSinhMe" runat="server" CssClass="form-control" placeholder="Nhập Năm sinh mẹ" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="HoTenVoChong">Họ và tên vợ/chồng</label>
                            <asp:TextBox ID="HoTenVoChong" runat="server" CssClass="form-control" placeholder="Nhập Họ và tên vợ/chồng"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="DanTocVoChong">Dân tộc vợ/chồng</label>
                            <asp:TextBox ID="DanTocVoChong" runat="server" CssClass="form-control" placeholder="Nhập Dân tộc vợ/chồng"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="NamSinhVoChong">Năm sinh vợ/chồng</label>
                            <asp:TextBox ID="NamSinhVoChong" runat="server" CssClass="form-control" placeholder="Nhập Năm sinh vợ/chồng" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <asp:Button ID="SubmitButton" OnClientClick="Modalguihs();" runat="server" Text="Nộp hồ sơ" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
            </div>
        </div>
    </div>

</asp:Content>
