<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="HSBVTT.aspx.cs" Inherits="SDH_VICTORY.HSBVTT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        color: #FF0000;
    }

    .form-input {
        border: 1px solid #ced4da;
        border-radius: .25rem;
        padding: .375rem .375rem;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="conntainer" id="quitrinh_hsbvtt" runat="server">
        <div class="card">
            <div class="card-header text-center card-primary-tvu card-header-tvu">
                <h2 class="">QUI TRÌNH NỘP HỒ SƠ BẢO VỆ TRỰC TUYẾN </h2>
            </div>
            <div class="card-body">
                <div class="container">
                    <asp:Image CssClass="img-fluid object-fit-contain" ImageUrl="~/Data/img/SODO_HSBVTT.png" runat="server" />
                    <%--<asp:Image CssClass="img-fluid object-fit-contain" ImageUrl="~/Data/img/quitrinh_chu.png" runat="server" />--%>
                </div>
            </div>
            <div class="card-footer">
                <asp:LinkButton CssClass="btn btn-primary" Text="Bước tiếp theo" ID="btn_nextstep" OnClick="btn_nextstep_Click" runat="server" />
            </div>
        </div>
    </div>
    
    <div class="container" id="hosobvtt" visible="false" runat="server">
        <div class="card">
            <div class="card-header text-center card-primary-tvu card-header-tvu">
                <h2>HỒ SƠ BẢO VỆ TRỰC TUYẾN</h2>
            </div>
            <div class="card-body">
                <div class="container mb-2">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                    <div class="progress" style="height: 30px;">
                        <div class="progress-bar bg-secondary" id="pro1" runat="server" role="progressbar" style="width: 33%">
                            Bước 1
                        </div>
                        <div class="progress-bar bg-secondary" id="pro2" runat="server" role="progressbar" style="width: 33%">
                            Bước 2
                        </div>
                        <div class="progress-bar bg-secondary" id="pro3" runat="server" role="progressbar" style="width: 33%">
                            Bước 3
                        </div>
                    </div>
                            
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>

                        <div id="card_B1" runat="server" visible="false">
                            <div id="hsdk" runat="server">
                                <div class="row mb-2">
                                    <div class="col text-danger">
                                        *Đặt tên file kết quả  quét của luận văn/ đề án:  <b>DE AN- HỌ TÊN HV - MÃ SỐ HỌC VIÊN</b>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col">
                                        <strong>1. Phiếu đăng ký bảo vệ </strong>
                                        <div class="form-input">
                                            <asp:FileUpload required="true" accept=".pdf,.jpg,.jpeg,.png" ID="file_dkbv" runat="server" />
                                            <asp:Label CssClass="fas fa-check-circle" Text="File đã nộp và được duyệt" ForeColor="Green" Visible="false" ID="lb_file_dkbv" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col">
                                        <strong>2. Báo cáo tiến độ thực hiện </strong>
                                        <div class="form-input">
                                            <asp:FileUpload  accept=".pdf,.jpg,.jpeg,.png" ID="file_bctiendo" runat="server" />
                                            <asp:Label CssClass="fas fa-check-circle" Text="File đã nộp và được duyệt" ForeColor="Green" Visible="false" ID="lb_file_bctiendo" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col">
                                        <strong>3. Phiếu nhận xét HDKH </strong>
                                        <div class="form-input">
                                            <asp:FileUpload  accept=".pdf,.jpg,.jpeg,.png" ID="file_hdkh" runat="server" />
                                            <asp:Label CssClass="fas fa-check-circle" Text="File đã nộp và được duyệt" ForeColor="Green" Visible="false" ID="lb_file_hdkh" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col">
                                        <strong>4. Bằng tốt nghiệp (photo)</strong>
                                        <div class="form-input">
                                            <asp:FileUpload  accept=".pdf,.jpg,.jpeg,.png" ID="file_totnghiep" runat="server" />
                                            <asp:Label CssClass="fas fa-check-circle" Text="File đã nộp và được duyệt" ForeColor="Green" Visible="false" ID="lb_file_totnghiep" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <hr class="bg-primary" />
                            <div class="row mb-2">
                                <div class="col">
                                    <strong>5. File luận văn </strong>
                                    <div class="form-input">
                                        <asp:FileUpload  accept=".pdf,.jpg,.jpeg,.png" ID="file_luanvan" runat="server" />
                                    <asp:Label CssClass="fas fa-check-circle" Text="File đã nộp và được duyệt" ForeColor="Green" Visible="false" ID="lb_file_luanvan" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col">
                                    <strong>6. Biên nhận quét Turnitin </strong>
                                    <div class="form-input">
                                        <asp:FileUpload  accept=".pdf,.jpg,.jpeg,.png" ID="file_biennhan_Turnitin" runat="server" />
                                    <asp:Label CssClass="fas fa-check-circle" Text="File đã nộp và được duyệt" ForeColor="Green" Visible="false" ID="lb_file_biennhan_Turnitin" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col">
                                    <strong>7. File kết quả quét Turnitin </strong>
                                    <div class="form-input">
                                        <asp:FileUpload  accept=".pdf,.jpg,.jpeg,.png" ID="file_ketqua_Turnitin" runat="server" />
                                    <asp:Label CssClass="fas fa-check-circle" Text="File đã nộp và được duyệt" ForeColor="Green" Visible="false" ID="lb_file_ketqua_Turnitin" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col">
                                    <asp:Button Text="Xác nhận nộp" CssClass="btn btn-primary" OnClick="btn_gui_b1_Click" ID="btn_gui_b1" runat="server" />
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers   >
                        <asp:PostBackTrigger ControlID="btn_gui_b1" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div id="card_B2" runat="server" visible="false">
                            <div class="row mb-2">
                                <div class="col">
                                    <strong>01 File luận văn/ đề án </strong>
                                    <div class="form-input">
                                        <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="fileup_b2" runat="server" />
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row mb-2">
                                <div class="col">
                                    <asp:Button Text="Xác nhận nộp" CssClass="btn btn-primary" OnClick="btn_gui_b2_Click" ID="btn_gui_b2" runat="server" />
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_gui_b2" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div id="card_B3" runat="server" visible="false">
                            <div class="row mb-2">
                                <div class="col">
                                    <strong>01 File luận văn/ đề án hoàn chỉnh </strong>
                                    <div class="form-input">
                                        <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="file_b3_1" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col">
                                    <strong>01 bản giải trình được thông qua người hướng dẫn và phản biện (nếu có yêu cầu từ hội đồng). </strong>
                                    <div class="form-input">
                                        <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="file_b3_2" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col">
                                    <asp:Button Text="Xác nhận nộp" CssClass="btn btn-primary"  ID="btn_gui_b3" OnClick="btn_gui_b3_Click" runat="server" />
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_gui_b3" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div id="card_completed" visible="false" runat="server">
                            <h2>Bạn đã hoàn thành toàn bộ quá trình hồ sơ bảo vệ trực tuyến</h2>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            
        </div>
    </div>
    <div class="card" style="display:none">
        <div class="card-header bg-primary text-white text-center font-weight-bolder">
           <b> ĐĂNG KÝ HỒ SƠ BẢO VỆ</b>
        </div>
        <div class="card-body border-0">
            <div class="text-center">
                <asp:LinkButton CssClass="fas fa-home" OnClick="Unnamed_Click" Font-Underline="false" Style="color: blue" runat="server" />
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="container" id="timhs" runat="server">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Panel runat="server" DefaultButton="btn_timcccd">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txt_timcccd" CssClass="form-control" placeholder="Nhập CCCD" />
                                        <div class="input-group-append">
                                            <asp:LinkButton CssClass=" btn btn-outline-secondary text-black"
                                                OnClick="btn_timcccd_Click" ID="btn_timcccd" runat="server">
                                                <span class="fas fa-search"></span>
                                            </asp:LinkButton>
                                            <asp:LinkButton Text="Tạo hồ sơ" OnClick="btn_hsmoi_Click" ID="btn_hsmoi" CssClass="btn btn-primary" runat="server" />
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:ListView ID="lv_hsnop" OnItemDataBound="lv_hsnop_ItemDataBound" runat="server">
                                    <ItemTemplate>
                                        <div class="card">
                                            <div class="card-header bg-info border-info text-center text-white mt-4">
                                                <asp:Label Text="" ID="lb_nganh" runat="server" />
                                            </div>
                                            <div class="card-body">
                                                <asp:GridView runat="server" ID="GV_HSNOP" OnRowDataBound="GV_HSNOP_RowDataBound" AutoGenerateColumns="false" CssClass="table table-sm table-bordered">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Các loại hồ sơ">
                                                            <ItemTemplate>
                                                                <asp:LinkButton Text="" OnClick="btn_loaihs_Click" ID="btn_loaihs" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Danh sách HS đã nộp">
                                                            <ItemTemplate>
                                                                <asp:Label Text="" ID="lb_cac_hs" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle CssClass="table-primary" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="container" id="div_nophs" runat="server" visible="false">
                        <div class="card border-primary w-100">
                            <div class="card-body">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg">
                                                <strong>Họ tên học viên<span class="auto-style1">*</span></strong>
                                                <asp:TextBox runat="server" ID="txt_hoten" required="true" CssClass="form-control" placeholder="Họ tên học viên" />
                                            </div>
                                            <div class="col-lg">
                                                <strong>Mã lớp<span class="auto-style1">*</span></strong>
                                                <asp:TextBox runat="server" ID="txt_malop" required="true" CssClass="form-control" placeholder="Mã lớp học viên" />
                                            </div>
                                            <div class="col-lg">
                                                <strong>Họ tên người nộp<span class="auto-style1">*</span></strong>
                                                <asp:TextBox runat="server" ID="txt_nguoinop" required="true" CssClass="form-control" placeholder="Họ tên người nộp" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <strong>CCCD<span class="auto-style1">*</span></strong>
                                                <asp:TextBox runat="server" ID="txt_cccd" required="true" CssClass="form-control" placeholder="CCCD/Mã HV" />
                                            </div>
                                            <div class="col-lg-4">
                                                <strong>Email<span class="auto-style1">*</span></strong>
                                                <asp:TextBox runat="server" ID="txt_email" TextMode="Email" required="true" CssClass="form-control" placeholder="Email" />
                                            </div>
                                            <div class="col-lg-4">
                                                <strong>Điện thoại <span class="auto-style1">*</span></strong>
                                                <asp:TextBox runat="server" ID="txt_dthoai" MaxLength="10" MinLength="10" TextMode="Phone" required="true" CssClass="form-control" placeholder="Điện thoại" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <strong>Mã HV<span class="auto-style1">*</span></strong>
                                                <asp:TextBox runat="server" ID="txt_mahv" required="true" CssClass="form-control" placeholder="Mã HV" />
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="row">
                                                    <div class="col-lg">
                                                        <strong>Số QĐ<span class="auto-style1">*</span></strong>
                                                        <asp:TextBox runat="server" ID="txt_soqd" required="true" CssClass="form-control" placeholder="Số QĐ" />
                                                    </div>
                                                    <div class="col-lg">
                                                        <strong>Ngành học<span class="auto-style1">*</span></strong>
                                                        <asp:DropDownList runat="server" ID="dr_nganhhoc" CssClass="select">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-lg" style="display: none">
                                                        <strong>Ngày học<span class="auto-style1">*</span></strong>
                                                        <asp:TextBox runat="server" ID="txt_ngayqd" TextMode="Date" CssClass="form-control" placeholder="Ngày QĐ" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <strong>Ngày nộp:</strong>
                                                <br />
                                                <div class="form-control">
                                                    <%= DateTime.Now.ToString("dd/MM/yyyy") %>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col">
                                                <h3 class="text-danger">Chọn hồ sơ cần gửi*</h3>
                                                <asp:RadioButtonList runat="server" ID="rd_loaihs" AutoPostBack="true" RepeatDirection="Vertical" RepeatLayout="Table" OnSelectedIndexChanged="rd_loaihs_SelectedIndexChanged">
                                                    <asp:ListItem Text="HỒ SƠ ĐĂNG KÝ BẢO VỆ VÀ KIỂM TRA TRÙNG LẶP" />
                                                    <asp:ListItem Text="HỒ SƠ TRƯỚC KHI BẢO VỆ" />
                                                    <asp:ListItem Text="HỒ SƠ SAU KHI BẢO VỆ" />
                                                    <asp:ListItem Text="HỒ SƠ TỐT NGHIỆP" />
                                                </asp:RadioButtonList>
                                                <%--<h4 class="text-danger">Lưu ý: toạn bộ file gửi là hình ảnh hoặc PDF</h4>--%>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="rd_loaihs" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <hr />
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div id="bv_kttrung" runat="server" visible="false">
                                            <div class="row">
                                                <div class="col-lg">
                                                    <asp:CheckBoxList ID="cb_bvkt" RepeatLayout="Table" Font-Size="14" RepeatDirection="Vertical" runat="server">
                                                        <asp:ListItem Text="1. 01 Quyển luận văn/ luận án" />
                                                        <asp:ListItem Text="2. 01 Đơn xin bảo vệ luận văn/ luận án" />
                                                        <asp:ListItem Text="3. 01 Bằng tốt nghiệp" />
                                                        <asp:ListItem Text="4. 01 Ngoại ngữ (Chứng chỉ; CN-NNA)" />
                                                        <asp:ListItem Text="5. 01 Báo cáo tiến độ thực hiện LV/LA" />
                                                        <asp:ListItem Text="6. 01 Phiếu nhận xét người hướng dẫn" />
                                                    </asp:CheckBoxList>
                                                </div>
                                                <div class="col-lg">
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <strong>1. 01 Quyển luận văn/ luận án </strong>
                                                            <br />
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_luanvan" runat="server" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <strong>2. 01 Đơn xin bảo vệ luận văn/ luận án </strong>
                                                            <br />
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_xinbv" runat="server" />

                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <strong>3. 01 Bằng tốt nghiệp</strong>
                                                            <br />
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_bangtn" runat="server" />

                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <strong>4. 01 Ngoại ngữ (Chứng chỉ; CN-NNA)</strong>
                                                            <br />
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_ngoaingu" runat="server" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <strong>5. 01 Báo cáo tiến độ thực hiện LV/LA</strong>
                                                            <br />
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_bctiendo" runat="server" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <strong>6. 01 Phiếu nhận xét người hướng dẫn<span class="auto-style1">*</span>: </strong>
                                                            <br />
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_phieunhanxet" runat="server" />

                                                            </div>

                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                            <div class="row mb-2">
                                                <div class="col">
                                                    <asp:Button Text="Gửi hồ sơ" OnClientClick="Modalguihs();" OnClick="btn_bvkt_trung_Click" CssClass="btn btn-primary" ID="btn_bvkt_trung" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btn_bvkt_trung" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div id="trc_bv" runat="server" visible="false">
                                            <div class="row">
                                                <div class="col-lg">
                                                    <asp:CheckBoxList runat="server" ID="cb_trcbv" Font-Size="14" RepeatLayout="Table" RepeatDirection="Vertical">
                                                        <asp:ListItem Text="1. 06 Quyển luận văn/ luận án" />
                                                        <asp:ListItem Text="2. 01 Bằng tốt nghiệp (photo công chứng)" />
                                                        <asp:ListItem Text="3. 01 Ngoại ngữ (Chứng chỉ: CN - NNA)" />
                                                        <asp:ListItem Text="4. 01 Phiếu nhận xét người hướng dẫn" />
                                                    </asp:CheckBoxList>
                                                </div>
                                                <div class="col-lg">
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <strong>1. 06 Quyển luận văn/ luận án</strong>
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_q1" runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <p><strong>2. 01 Bằng tốt nghiệp (photo công chứng)</strong></p>
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_bvbangtn" runat="server" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <p><strong>3. 01 Ngoại ngữ (Chứng chỉ: CN - NNA)</strong></p>
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_bvngoaingu" runat="server" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <p><strong>4. 01 Phiếu nhận xét người hướng dẫn</strong></p>
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_bvnhanxet" runat="server" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <asp:Button Text="Gửi hồ sơ" OnClientClick="Modalguihs();" ID="btn_trcbv" CssClass="btn btn-primary" OnClick="btn_trcbv_Click" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btn_trcbv" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div id="sau_bv" runat="server" visible="false">
                                            <div class="row">
                                                <div class="col-lg">
                                                    <asp:CheckBoxList runat="server" ID="cb_saubv" RepeatLayout="Table" Font-Size="14" RepeatDirection="Vertical">
                                                        <asp:ListItem Text="1. 01 Quyển luận văn/ luận án hoàn chỉnh" />
                                                        <asp:ListItem Text="2. 01 Bản tường trình nội dung chỉnh sửa" />
                                                        <asp:ListItem Text="3. 01 Biên bản hội đồng bảo vệ" />
                                                        <asp:ListItem Text="4. 01 Bản nhận xét các thành viên hội đồng (bản photo)" />
                                                        <asp:ListItem Text="5. 01 Phiếu xác nhận của người hướng dẫn" />
                                                    </asp:CheckBoxList>
                                                </div>
                                                <div class="col-lg">
                                                    <div style="" runat="server">
                                                        <div class="row mb-2">
                                                            <div class="col">
                                                                <p><strong>1. 01 Quyển luận văn/ luận án hoàn chỉnh</strong></p>
                                                                <div class="form-input">
                                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_lv_final" runat="server" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <div class="col">
                                                                <p><strong>2. 01 Bản tường trình nội dung chỉnh sửa</strong></p>
                                                                <div class="form-input">
                                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_tuongtrinh" runat="server" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <div class="col">
                                                                <p><strong>3. 01 Biên bản hội đồng bảo vệ</strong></p>
                                                                <div class="form-input">
                                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_bbhd_bv" runat="server" />

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <div class="col">
                                                                <p><strong>4. 01 Bản nhận xét các thành viên hội đồng (bản photo)</strong></p>
                                                                <div class="form-input">
                                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_nxhd" runat="server" />

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <div class="col">
                                                                <p><strong>5. 01 Phiếu xác nhận của người hướng dẫn</strong></p>
                                                                <div class="form-input">
                                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_xnhd" runat="server" />

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col">
                                                    <asp:Button Text="Gửi hồ sơ" OnClientClick="Modalguihs();" CssClass="btn btn-primary" OnClick="btn_saubv_Click" ID="btn_saubv" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btn_saubv" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div id="hstn" runat="server" visible="false">
                                            <div class="row">

                                                <div class="col-lg">

                                                    <asp:CheckBoxList runat="server" ID="cb_xettn" RepeatLayout="Table" RepeatDirection="Vertical">
                                                        <asp:ListItem Text="1. 01 Phiếu đề nghị xét tốt nghiệp" />
                                                        <asp:ListItem Text="2. 01 Phiếu nộp luận văn luận án" />
                                                        <asp:ListItem Text="3. 01 Chứng chỉ ngoại ngữ (photo công chứng)" />
                                                    </asp:CheckBoxList>
                                                </div>
                                                <div class="col-lg">
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <p><strong>1. 01 Phiếu đề nghị xét tốt nghiệp</strong></p>
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_dnxettn" runat="server" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <p><strong>2. 01 Phiếu nộp luận văn luận án</strong></p>
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_nopluanvan" runat="server" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <p><strong>3. 01 Chứng chỉ ngoại ngữ (photo công chứng)</strong></p>
                                                            <div class="form-input">
                                                                <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_chungchinn" runat="server" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col">
                                                    <asp:Button Text="Gửi hồ sơ" OnClientClick="Modalguihs();" OnClick="btn_hstn_Click" ID="btn_hstn" CssClass="btn btn-primary" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btn_hstn" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="modal fade" id="Modalguihs" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title text-primary">Thông báo</h4>

                </div>
                <div class="modal-body text-center">
                    <asp:Label ID="Label1" CssClass="text-gray-900" Text="Đang gửi hồ sơ" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
   
    <script>
        function Modalguihs() {
            {
                $('#Modalguihs').modal({ backdrop: 'static' });
                return true;
            }
            //else {
            //    return false;
            //}
        }
        $(function () {
            $(".select").chosen();
        });
        function pageLoad(sender, args) {
            if (args.get_isPartialLoad()) {
                // Reinitialize Chosen plugin after partial postback
                $(".select").chosen();
            }
        }
    </script>
</asp:Content>
