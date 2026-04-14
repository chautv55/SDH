<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="DK_HOC.aspx.cs" Inherits="SDH_VICTORY.DK_HOC" %>
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
            <div runat="server" id="LUACHON">
                <asp:LinkButton PostBackUrl="TSTS" CssClass=" btn btn-lienket mt-2" runat="server" >
                    <span class="fas fa-graduation-cap"></span>
                    ĐĂNG KÝ TUYỂN SINH THẠC SĨ
                </asp:LinkButton>
                <asp:LinkButton Text="" PostBackUrl="TSCK" CssClass="fas fa-graduation-cap btn btn-lienket mt-2" runat="server" >
                    <span class="fas fa-graduation-cap"></span>
                    ĐĂNG KÝ TUYỂN SINH CHUYÊN KHOA I, II
                </asp:LinkButton>
                <asp:LinkButton Text="" ID="BTN_TUVAN" OnClick="BTN_TUVAN_Click" CssClass="fas fa-graduation-cap btn btn-lienket mt-2" runat="server" >
                    <span class="fas fa-graduation-cap"></span>
                    NHẬN THÔNG TIN TƯ VẤN
                </asp:LinkButton>
            </div>

            <div class=" mt-4" runat="server" id="form_dk" visible="false">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg text-primary-tvu text-center">
                                <h3>ĐĂNG KÝ NHẬN THÔNG TIN TUYỂN SINH</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg text-center mt-2 ">
                                <h3>Thông tin tuyển sinh muốn nhận <span class="auto-style1">*</span></h3>
                                <div class="d-flex justify-content-center">
                                    <asp:RadioButtonList ID="rd_luachon"  AutoPostBack="true" OnSelectedIndexChanged="rd_luachon_SelectedIndexChanged" required="true" CssClass="table table-sm" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="Cao học" />
                                        <asp:ListItem Text="Nghiên cứu sinh" />
                                        <asp:ListItem Text="Chuyên khoa I-II" />
                                        <asp:ListItem Text="Bổ sung kiến thức" />
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Họ tên<span class="auto-style1">*</span></p>
                                <asp:TextBox runat="server" required="true" ID="txt_hoten" CssClass="form-control"/>
                            </div>
                            <div class="col-lg mt-2">
                                <p>Địa chỉ Email<span class="auto-style1">*</span></p>
                                <asp:TextBox runat="server" required="true" ID="txt_email" CssClass="form-control"  />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Điện thoại liên hệ<span class="auto-style1">*</span></p>
                                <asp:TextBox runat="server" required="true" ID="txt_sdt" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Ngành bạn mong muốn học thạc sĩ (hoặc tiến sĩ)</p>
                                <asp:DropDownList ID="dr_chon_nganhhoc" OnSelectedIndexChanged="dr_chon_nganhhoc_SelectedIndexChanged" AutoPostBack="true" CssClass="select" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Ngành bạn tốt nghiệp đại học</p>
                                <asp:TextBox runat="server" ID="txt_nganhtotnghiep" CssClass="form-control" />
                            </div>
                            <div class="col-lg mt-2">
                                <p>Năm tốt nghiệp</p>
                                <asp:TextBox runat="server" ID="txt_namtotnghiep" TextMode="Number"  CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row" id="monhoc" visible="false" runat="server">
                            <div class="col-lg mt-2">
                                <p>Chọn môn bổ sung kiến thức</p>
                                <asp:CheckBoxList runat="server" required="true" ID="cbl_monhoc">
                                </asp:CheckBoxList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <p>Thông tin bổ sung/tư vấn</p>
                                <asp:TextBox runat="server" ID="txt_ghichu" TextMode="MultiLine" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg mt-2">
                                <asp:Button Text="Gửi thông tin" ID="btn_nophs" OnClientClick="return validateAndShowModal();"
                                    OnClick="btn_nophs_Click" CssClass="btn btn-primary" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="modal " id="modal_thongbao" tabindex="-1" role="dialog" aria-labelledby="Modal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Label Text="Đang tải hồ sơ..." ID="lb_progress" runat="server" />
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
    $(function () {
        $(".select").chosen();
    });
    function check_form() {
        var elemnt = document.getElementById("form_dk");
        var req = elemnt.getElementsByClassName("*");
        var index = -1;
        for (var i = 0; i < req.length; i++) {
            // Thực hiện các thao tác mong muốn với mỗi phần tử con ở đây
            if (req[i].value == "") {
                if (index == -1) {
                    index = i;
                }
                req[i].style.border = '2px solid red';
            } else {
                req[i].style.border = '';
            }
        }
        if (index!=-1) {
            openModalalert("Vui lòng điền đầy đủ thông tin vào các ô màu đỏ!!!");

            req[index].focus();
            return false;
        }
        return true;
    }
    function modal_thongbao() {
        $('#modal_thongbao').modal({ backdrop: 'static', keyboard: false });
    }
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
    function pageLoad(sender, args) {
        if (args.get_isPartialLoad()) {
            // Reinitialize Chosen plugin after partial postback
            $(".select").chosen();
        }
    }
</script>
</asp:Content>
