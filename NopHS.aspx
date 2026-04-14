<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="NopHS.aspx.cs" Inherits="SDH_VICTORY.NopHS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nộp hồ sơ</title>
    <link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

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
    
    <link href="chosen/chosen.css" rel="stylesheet" />
    <script src="chosen/chosen.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <div class="row">
            <div class="col">
                <asp:Image runat="server" ImageUrl="~/Data/img/logo_bieumau.png" Style="object-fit: contain; width: 100%;" />
            </div>
        </div>
        <div class="text-center">
            <asp:LinkButton CssClass="fas fa-home" Font-Underline="false" Style="color: blue" PostBackUrl="Index" runat="server" />
        </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>

        <div class="container" id="timhs" runat="server">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:Panel runat="server" DefaultButton="btn_timcccd">
                        <div class="input-group">
                            <asp:TextBox runat="server" ID="txt_timcccd"  CssClass="form-control" placeholder="Nhập CCCD" />
                            <div class="input-group-append">
                                <asp:LinkButton CssClass=" btn btn-outline-secondary text-black"
                                    OnClick="btn_timcccd_Click" ID="btn_timcccd" runat="server">
                                        <span class="fas fa-search"></span>
                                </asp:LinkButton>
                        <asp:LinkButton Text="Tạo hồ sơ" OnClick="btn_hsmoi_Click" ID="btn_hsmoi" CssClass="btn btn-primary"  runat="server" />
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
                                            <asp:DropDownList runat="server" ID="dr_nganhhoc" CssClass="select" >
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg" style="display:none">
                                            <strong>Ngày học<span class="auto-style1">*</span></strong>
                                            <asp:TextBox runat="server" ID="txt_ngayqd"  TextMode="Date" CssClass="form-control" placeholder="Ngày QĐ" />
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
                        <Triggers   >
                            <asp:PostBackTrigger ControlID="rd_loaihs" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <hr />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div id="bv_kttrung"  runat="server" visible="false">
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
                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_luanvan"  runat="server" />
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row mb-2">
                                            <div class="col">
                                                <strong>2. 01 Đơn xin bảo vệ luận văn/ luận án </strong>
                                                <br />
                                                <div class="form-input">
                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_xinbv"  runat="server" />

                                                </div>
                                            </div>

                                        </div>
                                        <div class="row mb-2">
                                            <div class="col">
                                                <strong>3. 01 Bằng tốt nghiệp</strong>
                                                <br />
                                                <div class="form-input">
                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_bangtn"  runat="server" />

                                                </div>
                                            </div>

                                        </div>
                                        <div class="row mb-2">
                                            <div class="col">
                                                <strong>4. 01 Ngoại ngữ (Chứng chỉ; CN-NNA)</strong>
                                                <br />
                                                <div class="form-input">
                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_ngoaingu"  runat="server" />

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col">
                                                <strong>5. 01 Báo cáo tiến độ thực hiện LV/LA</strong>
                                                <br />
                                                <div class="form-input">
                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_bctiendo"  runat="server" />

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
                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_q1"  runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col">
                                                <p><strong>2. 01 Bằng tốt nghiệp (photo công chứng)</strong></p>
                                                <div class="form-input">
                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_bvbangtn"  runat="server" />

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col">
                                                <p><strong>3. 01 Ngoại ngữ (Chứng chỉ: CN - NNA)</strong></p>
                                                <div class="form-input">
                                                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_bvngoaingu"  runat="server" />

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
                            <div id="sau_bv" runat="server" visible="false" >
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
                            <div id="hstn" runat="server" visible="false" >
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
                                            <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_dnxettn"  runat="server" />

                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col">
                                        <p><strong>2. 01 Phiếu nộp luận văn luận án</strong></p>
                                        <div class="form-input">
                                            <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" ID="up_nopluanvan"  runat="server" />

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
        <div class="modal fade" id="Modalalert" tabindex="-1" role="dialog"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-primary">Thông báo</h4>

                    </div>
                    <div class="modal-body text-center">
                        <asp:Label ID="lbtb" CssClass="text-gray-900" runat="server"></asp:Label>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function openModalalert(texttb) {
                $('#Modalalert').modal({ backdrop: 'static' });
                document.getElementById('lbtb').innerHTML = texttb;
            }
            function Modalguihs() {
                var form = document.getElementById('<%= form1.ClientID%>');
                if(form.checkValidity())
                {
                    $('#Modalguihs').modal({ backdrop: 'static' });
                    return true;
                }
                else {
                    return false;
                }
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

    </form>
</body>
</html>
