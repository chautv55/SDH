<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" Async="true" CodeBehind="TSCK.aspx.cs" Inherits="SDH_VICTORY.TSCK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="card">
                <div class="card-header text-center card-primary-tvu card-header-tvu">
                    <h3>PHIẾU ĐĂNG KÝ TUYỂN SINH CHUYÊN KHOA CẤP I , II</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col text-center ">
                            <asp:DropDownList CssClass="select text-danger" runat="server" required="true" AutoPostBack="true" OnSelectedIndexChanged="dr_chon_cnganh_SelectedIndexChanged" ID="dr_chon_cnganh">
                                <asp:ListItem Text="--CHỌN CHUYÊN NGÀNH DỰ TUYỂN---" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <hr />
                    <div id="body_form" style="display: none;" runat="server">
                        <div class="row mt-2">
                            <div class="col text-center text-primary">
                                <h4>THÔNG TIN HỒ SƠ</h4>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-lg mt-2">
                                <p>Họ tên<span class="auto-style1">*</span></p>
                                <asp:TextBox placeholder="Họ tên" ID="txt_hoten" required="true" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg-3 mt-2">
                                <p>Giới tính<span class="auto-style1">*</span></p>
                                <asp:DropDownList runat="server" ID="dr_gioitinh" CssClass="form-control">
                                    <asp:ListItem Text="Nam" />
                                    <asp:ListItem Text="Nữ" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-lg mt-2">
                                <p>Ngày sinh<span class="auto-style1">*</span></p>
                                <asp:TextBox placeholder="Ngày sinh" ID="txt_ngaysinh" TextMode="Date" required="true" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Nơi sinh<span class="auto-style1">*</span></p>
                                <asp:DropDownList runat="server" ID="dr_noisinh" CssClass="select"></asp:DropDownList>
                            </div>
                            <div class="col-lg mt-2">
                                <p>Dân tộc<span class="auto-style1">*</span></p>
                                <asp:DropDownList runat="server" ID="dr_dantoc" CssClass="select"></asp:DropDownList>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Căn cước công dân<span class="auto-style1">*</span></p>
                                <asp:TextBox placeholder="CCCD" ID="txt_cccd" required="true" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Ngày cấp<span class="auto-style1">*</span></p>
                                <asp:TextBox placeholder="Ngày cấp" ID="txt_ngaycap_cccd" TextMode="Date" runat="server" required="true" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Nơi cấp<span class="auto-style1">*</span></p>
                                <asp:TextBox placeholder="Nơi cấp" ID="txt_noicap_cccd" runat="server" required="true" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Điện thoại<span class="auto-style1">*</span></p>
                                <asp:TextBox placeholder="Điện thoại" ID="txt_dienthoai" TextMode="Phone" required="true" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Email<span class="auto-style1">*</span></p>
                                <asp:TextBox placeholder="Email" ID="txt_email" runat="server" TextMode="Email" required="true" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Nơi ở hiện nay (theo VNeID) <em>(ghi rõ số nhà, đường, phường (xã), tỉnh (thành phố)</em><span class="auto-style1">*</span></p>
                                <%--<asp:TextBox placeholder="Nơi ở hiện nay (theo VNeID)" ID="txt_hokhau" runat="server" required="true" CssClass="form-control" />--%>
                                <div class="row">
                                    <div class="col-lg">
                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Số nhà, đường,..." ID="txt_sonha" />
                                    </div>
                                    <div class="col-lg">
                                        <asp:DropDownList runat="server" ID="dr_tinh" CssClass="select" OnSelectedIndexChanged="dr_tinh_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg">
                                        <asp:DropDownList runat="server" ID="dr_phuong" CssClass="select">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Địa chỉ liên lạc<span class="auto-style1">*</span></p>
                                <asp:TextBox placeholder="Địa chỉ liên lạc" ID="txt_diachi" runat="server" required="true" CssClass="form-control" />
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col text-center text-primary">
                                <h3>Thông tin văn bằng đại học thí sinh sử dụng để dự tuyển chuyên khoa</h3>
                            </div>
                        </div>
                        <div class="row">
                            <%--<div class="col-lg mt-2">
                                <p>Ngành<span class="auto-style1">*</span></p>
                                <asp:DropDownList runat="server" ID="dr_nganh" AutoPostBack="true" OnSelectedIndexChanged="dr_nganh_SelectedIndexChanged" CssClass="select">
                                </asp:DropDownList>
                            </div>--%>
                            <div class="col-lg mt-2">
                                <p>Chuyên ngành<span class="auto-style1">*</span></p>
                                <asp:TextBox ID="txt_chuyennganh" required="true" runat="server" CssClass="form-control" placeholder="Chuyên ngành" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Hình thức đào tạo<span class="auto-style1">*</span></p>
                                <asp:TextBox placeholder="Hình thức đào tạo" required="true" ID="txt_daotao" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Xếp loại<span class="auto-style1">*</span></p>
                                <asp:TextBox placeholder="Xếp loại" required="true" ID="txt_xeploai" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Số hiệu bằng<span class="auto-style1">*</span></p>
                                <asp:TextBox placeholder="Số hiệu bằng" required="true" ID="txt_sohieu" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Năm tốt nghiệp<span class="auto-style1">*</span></p>
                                <asp:TextBox placeholder="Năm tốt nghiệp " ID="txt_namtotnghiep" TextMode="Number" required="true" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Cơ sở đào tạo</p>
                                <asp:TextBox placeholder="Cơ sở đào tạo" ID="txt_csdt" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col text-center text-primary">
                                <h3>Thông tin bằng cấp, chứng chỉ dùng để xét miễn thi Ngoại ngữ (hồ sơ minh chứng kèm theo)</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Bằng cấp/Chứng chỉ</p>
                                <asp:DropDownList runat="server" ID="dr_mienthi_nn" CssClass="form-control">
                                    <asp:ListItem Text="--------" />
                                    <asp:ListItem Text="Bằng cấp" />
                                    <asp:ListItem Text="Chứng chỉ" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg mt-2">
                                <p>Số hiệu</p>
                                <asp:TextBox placeholder="Số hiệu " ID="txt_sohieu_NN" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Nơi cấp</p>
                                <asp:TextBox placeholder="Nơi cấp " ID="txt_noicap_NN" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Ngày cấp</p>
                                <asp:TextBox placeholder="Ngày cấp" ID="txt_ngaycap_NN" TextMode="Date" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <hr />
                        <div class="row mt-2">
                            <div class="col text-center text-primary">
                                <h4>CHỨNG CHỈ HÀNH NGHỀ</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Chứng chỉ hành nghề (Số hiệu)</p>
                                <asp:TextBox placeholder="Số hiệu" ID="txt_cchn_sohieu" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Ngày cấp</p>
                                <asp:TextBox placeholder="Ngày cấp" ID="txt_ngaycap_cchn" TextMode="Date" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Nơi cấp</p>
                                <asp:TextBox placeholder="Nơi cấp " ID="txt_noicap_cchn" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Phạm vi</p>
                                <asp:TextBox placeholder="Phạm vi" ID="txt_phamvi_cchn" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <hr />
                        <div class="row mt-2">
                            <div class="col text-center text-primary">
                                <h4>ĐƠN VỊ CÔNG TÁC</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Công việc hiện nay</p>
                                <asp:TextBox placeholder="Công việc hiện nay" ID="txt_congviec" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Số năm làm việc</p>
                                <asp:TextBox placeholder="Số năm làm việc" ID="txt_namlamviec" TextMode="Number" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Đơn vị làm việc</p>
                                <asp:TextBox placeholder="Đơn vị làm việc" ID="txt_donvi" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Địa chỉ làm việc</p>
                                <asp:TextBox placeholder="Địa chỉ làm việc" ID="txt_diachi_donvi" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Điện thoại nơi làm việc</p>
                                <asp:TextBox placeholder="Điện thoại nơi làm việc" ID="txt_dienthoai_donvi" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Email nơi làm việc</p>
                                <asp:TextBox placeholder="Email nơi làm việc" ID="txt_email_donvi" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <hr />
                        <div class="row mt-2">
                            <div class="col text-center text-primary">
                                <h4>HỒ SƠ ĐIỆN TỬ</h4>
                            </div>
                        </div>
                        <div class="row">
                            <%--<div class="col-lg mt-2">
                            <p>Phiếu dự tuyển <span class="auto-style1">* (tải về in ra nộp theo bản hồ sơ giấy)</span></p>
                            <asp:LinkButton Text="Tải phiếu" CssClass="btn btn-outline-primary" OnClick="btn_taipdf_Click" ID="btn_taipdf" runat="server" />
                            <%--<asp:FileUpload runat="server" ID="file_phieudutuyen" required="true" accept="image/*, application/pdf"/>--%>
                        <div class="col-lg mt-2">
                            <p>Ảnh 4x6 (hình thẻ)      <span class="auto-style1">*</span></p>
                            <asp:FileUpload runat="server" ID="file_anh4x6" required="true" accept="image/*, application/pdf" />
                        </div>
                        <div class="col-lg mt-2">
                            <p>Căn cước công dân <span class="auto-style1">*</span></p>
                            <asp:FileUpload runat="server" ID="file_cccd" required="true" accept="image/*, application/pdf" />
                        </div>
                        </div>

                        <hr />
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Bằng đại học/CKI<span class="auto-style1">*</span></p>
                                <asp:FileUpload runat="server" ID="file_bangdh" required="true" accept="image/*, application/pdf" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Bảng điểm đại học/CKI <span class="auto-style1">*</span></p>
                                <asp:FileUpload runat="server" ID="file_bangdiem" required="true" accept="image/*, application/pdf" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Chứng chỉ hành nghề </p>
                                <asp:FileUpload runat="server" ID="file_cchn" accept="image/*, application/pdf" />
                            </div>

                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Sơ yếu lý lịch </p>
                                <asp:FileUpload runat="server" ID="file_soyeulilich" accept="image/*, application/pdf" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Xác nhận thâm niên công tác   </p>
                                <asp:FileUpload runat="server" ID="file_thamnien" accept="image/*, application/pdf" />
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <asp:Button Text="Nộp hồ sơ đăng ký" OnClientClick="return validateAndShowModal();" CssClass="btn btn-primary" ID="btn_nop_ck" OnClick="btn_nop_ck_Click" runat="server" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>
                                    <span class="auto-style1">
                                        <asp:LinkButton Text="Tải trước phiếu dự tuyển" CssClass="btn btn-outline-info" ID="btn_taipdf" OnClick="btn_taipdf_Click1" runat="server" />
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_nop_ck" />
            <asp:PostBackTrigger ControlID="btn_taipdf" />
        </Triggers>
    </asp:UpdatePanel>
    <div class="modal modal-fade" id="modal_thongbao" tabindex="-1" role="dialog" aria-labelledby="Modal"  aria-hidden="true" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body text-center">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                    <h2><asp:Label Text="Đang tải hồ sơ..." ID="lb_progress" runat="server" /></h2>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="modal-footer">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:LinkButton Text="Xác nhận" ID="btn_ok" PostBackUrl="index" Visible="false" CssClass="btn btn-primary" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</div>
    
    <script>
        function validateAndShowModal() {
            var form = document.forms[0]; // form ASP.NET mặc định
            if (form.checkValidity()) {
                $('#modal_thongbao').modal({ backdrop: 'static', keyboard: false });
                return true; // không postback ngay
            } else {
                form.reportValidity(); // hiển thị lỗi required
                return false;
            }
        }
        function modal_thongbao() {
            $('#modal_thongbao').modal({ backdrop: 'static', keyboard: false });
        }
        
    </script>
</asp:Content>
