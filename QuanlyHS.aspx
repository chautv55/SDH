<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanlyHS.aspx.cs" Inherits="SDH_VICTORY.QuanlyHS" %>
<%@ Register Src="~/DynamicData/FieldTemplates/Form_data.ascx" TagPrefix="uc" TagName="Form_DATA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý hồ sơ</title>
    <link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="scripts/quicksearch.js"></script>

    <link href="chosen/chosen.css" rel="stylesheet" />
    <script src="chosen/chosen.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <script>
            $(function () {
                $(".select").chosen();
            });
        </script>
        <asp:ScriptManager runat="server" />
        <div class="ml-2 mr-2 header-fix">

        <div class="row" >
            <div class="col-lg">
                 <div class="alert alert-warning text-justify ">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="form-inline w-100 mb-2 mt-2">
                                    <asp:Button UseSubmitBehavior="false" Text="Home" PostBackUrl="Index" CssClass="btn-sm btn btn-primary " runat="server" />
                                    <asp:TextBox runat="server" CssClass="form-control form-control-sm " onblur="post_(this);" TextMode="Date" ID="txt_start" OnTextChanged="txt_ngaythang_TextChanged" />
                                    <asp:TextBox runat="server" CssClass="form-control form-control-sm " onblur="post_(this);" TextMode="Date" ID="txt_end" OnTextChanged="txt_ngaythang_TextChanged" />
                                    <div>
                                        <asp:RadioButtonList runat="server" ID="rd_loai"
                                            CssClass="form-inline" RepeatLayout="Flow"
                                            AutoPostBack="true" OnSelectedIndexChanged="rd_loai_SelectedIndexChanged">
                                            <asp:ListItem Text="Hồ sơ BV" />
                                            <asp:ListItem Text="Hồ sơ TT" />
                                            <asp:ListItem Text="Hồ sơ BVTT" />
                                        </asp:RadioButtonList>
                                    </div>
                                    <div id="hs_tt" class="d-flex mt-2" runat="server" visible="false">
                                        <asp:DropDownList Visible="false" runat="server" CssClass="select" ID="dr_hstt" OnSelectedIndexChanged="dr_hstt_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                        <asp:TextBox Visible="false" runat="server" TextMode="Number" CssClass="form-control form-control-sm" ID="txt_timhs_tt" OnTextChanged="txt_timhs_tt_TextChanged" AutoPostBack="true" placeholder="Số HS" />
                                        <asp:DropDownList OnSelectedIndexChanged="dr_form_hstt_SelectedIndexChanged"
                                            runat="server" AutoPostBack="true" CssClass="select" ID="dr_form_hstt">
                                        </asp:DropDownList>
                                    </div>
                                    <div id="hs_bv" class="" runat="server" visible="false">
                                        <div class="col-lg d-flex">
                                            <div class="d-flex">
                                                <asp:TextBox runat="server" CssClass="form-control form-control-sm " AutoPostBack="true" OnTextChanged="txt_timhs_TextChanged" ID="txt_timhs" placeholder="MAHV/CCCD/Họ tên/SĐT tìm kiếm" />
                                                <asp:DropDownList ID="dr_loc_nganh" AutoPostBack="true" OnSelectedIndexChanged="dr_loc_nganh_SelectedIndexChanged" CssClass="select" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="">
                                                <%--<asp:RadioButtonList ID="rd_loaiHS" RepeatDirection="Horizontal" CssClass="form-inline bg-white mt-2 " AutoPostBack="true" OnSelectedIndexChanged="rd_loaiHS_SelectedIndexChanged"
                                                runat="server">
                                            </asp:RadioButtonList>--%>
                                                <asp:DropDownList CssClass="select" AutoPostBack="true" OnSelectedIndexChanged="rd_loaiHS_SelectedIndexChanged" ID="rd_loaiHS" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                            <div>
                                                <asp:LinkButton Text="Xuất DS" CssClass="btn btn-success btn-sm" OnClick="export_excel_Click" Font-Underline="false" ID="export_excel" runat="server">
                                            <i class=" fa fa-download"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="hsbvtt" runat="server" visible="false">
                                        <div class="col-lg d-flex">
                                            <asp:TextBox runat="server" CssClass="form-control form-control-sm " AutoPostBack="true" OnTextChanged="txt_tim_hsbvtt_TextChanged"
                                                ID="txt_tim_hsbvtt" placeholder="MAHV/CCCD/Họ tên/SĐT tìm kiếm" />
                                        </div>
                                    </div>
                                    <asp:LinkButton Text="Gmail" OnClick="btn_qlGmail_Click" data-toggle="modal" data-target="#modal_gmail" CssClass="ml-auto btn btn-sm btn-outline-danger" ID="btn_qlGmail" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                </div>
            </div>
        </div>
            <div class="row" style="height: 100%;">
                <div class="col-lg">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <table class="table table-sm " id="tb_hs_tt" runat="server">
                                <tr>
                                    <td>
                                        <div style="display: none">
                                            <div>

                                                <asp:Label Text="" ID="lb_load_info" runat="server" />
                                                <asp:LinkButton ID="btn_reload" OnClick="btn_reload_Click" CssClass="fa fa-refresh ml-2" ForeColor="blue" Font-Underline="false" runat="server" />
                                            </div>
                                        </div>
                                        <div class="container mt-2">
                                            <asp:GridView runat="server" OnDataBound="gv_dstt_DataBound"
                                                OnRowDataBound="gv_dstt_RowDataBound" AutoGenerateColumns="false"
                                                ID="gv_dstt" CssClass="table table-sm table-striped table-borderless border-0 table-hover" ShowHeader="true">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-Width="3%" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" OnClick="btn_xem_Click" CommandArgument='<%# Eval("ID") %>' CssClass="far fa-file-pdf" ForeColor="Red" Font-Underline="false" ID="btn_xem"></asp:LinkButton>
                                                            <asp:LinkButton runat="server" OnClick="btn_check_Click" CommandArgument='<%# Eval("ID") %>' CssClass="far fa-check-circle mt-2 " ForeColor="Green" Font-Underline="false" ID="btn_check"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="ID" HeaderText="SỐ HS" ItemStyle-Width="7%" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="ngaynop" HeaderText="Ngày nộp" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%" />
                                                    <asp:TemplateField HeaderText="Thông tin cơ bản">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lb_info" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="File">
                                                        <ItemTemplate>
                                                            <asp:PlaceHolder runat="server" ID="pl_linkbutton" />
                                                            <asp:LinkButton ID="btn_viewhd" Visible="false" CssClass="fab fa-wpforms" Font-Underline="false" ForeColor="Green" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="text-center" />
                                                <AlternatingRowStyle BackColor="#efefff" />
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <asp:LinkButton Text="" ID="view_export_pdf" target="_blank" Style="display: none" runat="server" />
                            <table class="w-100 " id="tb_hsbv" runat="server">
                                <tr>
                                    <td>
                                        <div style="position: static">
                                            <div class="container">

                                                <div class="card border-primary mt-4 ">
                                                    <div class="card-body">
                                                        <div class="form-inline d-flex justify-content-center">
                                                            <asp:Label Text="" ID="lb_report" runat="server" />
                                                            <asp:LinkButton ID="refesrh" OnClick="refesrh_Click" Visible="false" CssClass="fa fa-refresh ml-2" ForeColor="blue" Font-Underline="false" runat="server" />
                                                        </div>
                                                        <asp:ListView runat="server" ID="lv_item" OnSelectedIndexChanging="lv_item_SelectedIndexChanging" OnItemDataBound="lv_item_ItemDataBound" ItemPlaceholderID="pl_item">
                                                            <LayoutTemplate>
                                                                <div class="row">
                                                                    <asp:PlaceHolder runat="server" ID="pl_item"></asp:PlaceHolder>
                                                                </div>
                                                            </LayoutTemplate>
                                                            <ItemTemplate>
                                                                <div class="col-lg-4">
                                                                    <div class="card mb-2">
                                                                        <div class="card-header form-inline" runat="server" id="card_item">
                                                                            <b>
                                                                                <asp:LinkButton ForeColor="Black" Font-Underline="false" ID="btn_cccd" CommandName="Select" CommandArgument='<%# Eval("id") %>' CssClass="fas fa-graduation-cap" Text='<%# Eval("hoten")+"-"+Eval("malop") %>'
                                                                                    runat="server" /></b>
                                                                            <asp:Label Text="" ID="ngayduyet" CssClass="ml-auto" runat="server" />
                                                                        </div>
                                                                        <div class="card-body">
                                                                            <div class="row">
                                                                                <div class="col-lg">
                                                                                    <div class="row mb-2">
                                                                                        <asp:Label CssClass="fas fa-user-circle" Text='<%# Eval("MAHV") %>' runat="server" />
                                                                                    </div>
                                                                                    <div class="row mb-2">
                                                                                        <asp:Label CssClass="fas fa-user-alt" Text='<%# Eval("hoten") %>' runat="server" />
                                                                                    </div>
                                                                                    <div class="row mb-2">
                                                                                        <asp:Label CssClass="fas fa-phone-alt" Text='<%# Eval("sdt") %>' runat="server" />
                                                                                    </div>
                                                                                    <div class="row mb-2">
                                                                                        <asp:Label CssClass="fas fa-mail-bulk" Text='<%# Eval("Email") %>' runat="server" />
                                                                                    </div>
                                                                                    <div class="row mb-2">
                                                                                        <asp:Label CssClass="fas fa-calendar-alt" Text='<%# Eval("ngaynop") %>' runat="server" />
                                                                                    </div>
                                                                                    <div class="row mb-2">
                                                                                        <asp:Label CssClass="far fa-bookmark" ID="lb_nganh" runat="server" />
                                                                                    </div>
                                                                                    <div class="row mb-2">
                                                                                        <asp:Label CssClass="fas fa-book-reader" Text='<%#Eval("nguoinop") %>' runat="server" />
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg">
                                                                                    <asp:ListView ID="lv_check" runat="server" OnItemDataBound="lv_check_ItemDataBound">
                                                                                        <ItemTemplate>
                                                                                            <div class="row form-inline">
                                                                                                <asp:LinkButton Font-Underline="false" Text="" ID="lb_cb" runat="server" />
                                                                                            </div>
                                                                                        </ItemTemplate>
                                                                                    </asp:ListView>
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <asp:ListView ID="lv_file" OnItemDataBound="lv_file_ItemDataBound" runat="server">
                                                                                    <ItemTemplate>
                                                                                        <div class="col-lg-1">
                                                                                            <asp:LinkButton Text="" Font-Underline="false" ID="btn_file" runat="server" />
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                </asp:ListView>
                                                                            </div>

                                                                        </div>
                                                                        <div class="card-footer form-inline ">
                                                                            <asp:Label Text="" ID="ngduyet" runat="server" />
                                                                            <asp:LinkButton ID="check" Font-Underline="false" OnClick="check_Click" CommandArgument='<%# Eval("id") %>' CssClass="far fa-check-circle ml-auto" Style="color: green" runat="server" />
                                                                            <asp:LinkButton ID="export_pdf" Font-Underline="false" OnClick="export_pdf_Click" CommandArgument='<%# Eval("id") %>' CssClass="far fa-file-pdf ml-4" Style="color: red" runat="server" />
                                                                            <asp:LinkButton ID="download_all" Font-Underline="false" Visible="false" OnClick="download_all_Click" CommandArgument='<%# Eval("id") %>' CssClass="fa fa-download ml-4" Style="color: blue"
                                                                                runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div id="hstt" runat="server" visible="false">
                                <uc:Form_DATA runat="server" ID="Control_Form" />
                            </div>
                            <div id="data_HSBVTT" runat="server" visible="false">
                                <div class="row">
                                    <div class="col-lg">
                                        <div class="card">
                                            <div class="card-header">
                                                <asp:LinkButton Text="Bước 1" id="show_body_gmailb1" OnClick="show_body_gmailb1_Click" Font-Underline="false" runat="server" />
                                            </div>
                                            <div class="card-body" id="body_gmailb1" runat="server" visible="false">
                                                Tài khoản gửi
                                                <asp:DropDownList runat="server" CssClass="select" ID="dr_chon_ngnhan1" AutoPostBack="true" OnSelectedIndexChanged="dr_chon_ngnhan1_SelectedIndexChanged">  </asp:DropDownList>
                                                Người nhận    
                                                <asp:DropDownList runat="server" CssClass="select" ID="DR_CHON_reciver1" AutoPostBack="true" OnSelectedIndexChanged="DR_CHON_reciver1_SelectedIndexChanged">    </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg">
                                        <div class="card">
                                            <div class="card-header" >
                                                <asp:LinkButton Text="Bước 2" id="show_body_gmailb2" OnClick="show_body_gmailb1_Click" Font-Underline="false" runat="server" />
                                            </div>
                                            <div class="card-body" id="body_gmailb2" runat="server" visible="false">
                                                Tài khoản gửi
            <asp:DropDownList runat="server" CssClass="select" ID="dr_chon_ngnhan2" AutoPostBack="true" OnSelectedIndexChanged="dr_chon_ngnhan1_SelectedIndexChanged"></asp:DropDownList>
                                                Người nhận    
            <asp:DropDownList runat="server" CssClass="select" ID="DR_CHON_reciver2" AutoPostBack="true" OnSelectedIndexChanged="DR_CHON_reciver1_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg">
                                        <div class="card">
                                            <div class="card-header">
                                                <asp:LinkButton Text="Bước 3" id="show_body_gmailb3" OnClick="show_body_gmailb1_Click" Font-Underline="false" runat="server" />
                                            </div>
                                            <div class="card-body" id="body_gmailb3" runat="server" visible="false">
                                                Tài khoản gửi
            <asp:DropDownList runat="server" CssClass="select" ID="dr_chon_ngnhan3" AutoPostBack="true" OnSelectedIndexChanged="dr_chon_ngnhan1_SelectedIndexChanged"></asp:DropDownList>
                                                Người nhận    
            <asp:DropDownList runat="server" CssClass="select" ID="DR_CHON_reciver3" AutoPostBack="true" OnSelectedIndexChanged="DR_CHON_reciver1_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <asp:ListView ID="lv_HSBVTT" OnItemDataBound="lv_HSBVTT_ItemDataBound" DataKeyNames="ID" ItemPlaceholderID="pl_data" runat="server">
                                    <LayoutTemplate>
                                        <table class="table table-sm table-bordered">
                                            <tr class="text-center font-weight-bold">
                                                <td>Ngày nộp</td>
                                                <td>Bước nộp</td>
                                                <td>Thông tin người nộp</td>
                                                <td colspan="2">FILE</td>
                                            </tr>
                                            <asp:PlaceHolder runat="server" ID="pl_data" />
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="text-center align-content-center">
                                                <asp:Label Text='<%#  Eval("NGAYNOP","{0:dd/MM/yyyy}") %>' runat="server" /></td>
                                            <td class="text-center align-content-center">
                                                <asp:Label Text='<%#  Eval("BUOC") %>' runat="server" /></td>
                                            <td>
                                                <asp:Label Text="" ID="lb_tt_HV" runat="server" />
                                                <asp:ListView ID="lv_file_HSBVTT" ItemPlaceholderID="pl_file" OnItemDataBound="lv_file_HSBVTT_ItemDataBound" runat="server">
                                                    <LayoutTemplate>
                                                        <ul style="list-style: decimal">
                                                            <asp:PlaceHolder runat="server" ID="pl_file" />
                                                        </ul>
                                                    </LayoutTemplate>
                                                    <ItemTemplate>
                                                        <li>
                                                            <div class="form-inline">
                                                                <asp:LinkButton ID="btn_onedownload" OnClick="btn_onedownload_Click" CssClass="btn btn-sm btn-outline-primary fa fa-download " runat="server" />
                                                                <asp:CheckBox ID="cb_duyet" OnCheckedChanged="cb_duyet_CheckedChanged" AutoPostBack="true" Text="" runat="server" />
                                                            </div>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </td>
                                            <td class="text-center align-content-center">
                                                <asp:LinkButton Text="Tải tất cả về" OnClick="btn_down_HSBVTT_Click" CommandArgument='<%#  Eval("ID") %>' CssClass="btn btn-sm btn-outline-success fa fa-download" ID="btn_down_HSBVTT" runat="server" />
                                            </td>
                                            <td class="text-center align-content-center">
                                                <asp:LinkButton Text="Chuyển đi" OnClick="btn_forwart_togmail_Click" Visible="false" ID="btn_forwart_togmail" CssClass="btn btn-sm btn-outline-primary" CommandArgument='<%#  Eval("ID") %>' runat="server" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="modal_hshv" tabindex="-1" role="dialog"
            aria-hidden="true">
            <div class="modal-dialog modal-lg"  role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-primary">Hồ sơ học viên</h4>
                    </div>
                    <div class="modal-body text-center">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="text-center" style="display:none">
                                    <asp:Label Text="" ID="lb_alert" ForeColor="Red" Font-Bold="true" runat="server" />
                                    <asp:LinkButton Text="Tạo học viên" CssClass="" OnClick="add_hv_Click" ID="add_hv" Font-Underline="false" runat="server" />
                                </div>
                                <div class="card">
                                    <div class="card-header font-weight-bold">Hồ sơ kiểm tra trùng lắp</div>
                                    <div class="card-body">
                                        <table class="table table-sm table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Hồ sơ</th>
                                                    <th style="width: 100px;">Tình trạng</th>
                                                    <th style="width: 180px;">Ngày xác nhận</th>
                                                </tr>
                                            </thead>
                                            <tr>
                                                <td>1. 01 Quyển luận văn/ luận án</td>
                                                <td>
                                                    <asp:CheckBox AutoPostBack="true" OnCheckedChanged="_1cb_luanvan_CheckedChanged" ID="_1cb_luanvan" runat="server" /></td>
                                                <td>
                                                    <asp:Label ID="_1lb_ngaylv" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>2. 01 Đơn xin bảo vệ luận văn/ luận án</td>
                                                <td>
                                                    <asp:CheckBox AutoPostBack="true" OnCheckedChanged="_1cb_luanvan_CheckedChanged" ID="_1cb_xin_bvlv" runat="server" /></td>
                                                <td>
                                                    <asp:Label ID="_1lb_ngayxin" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>3. 01 Bằng tốt nghiệp</td>
                                                <td>
                                                    <asp:CheckBox AutoPostBack="true" OnCheckedChanged="_1cb_luanvan_CheckedChanged" ID="_1cb_bangtn" runat="server" /></td>
                                                <td>
                                                    <asp:Label ID="_1lb_ngaytn" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>4. 01 Ngoại ngữ (Chứng chỉ; CN-NNA)</td>
                                                <td>
                                                    <asp:CheckBox AutoPostBack="true" OnCheckedChanged="_1cb_luanvan_CheckedChanged" ID="_1cb_ngoaingu" runat="server" /></td>
                                                <td>
                                                    <asp:Label ID="_1ngay_nn" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>5. 01 Báo cáo tiến độ thực hiện LV/LA</td>
                                                <td>
                                                    <asp:CheckBox AutoPostBack="true" OnCheckedChanged="_1cb_luanvan_CheckedChanged" ID="_1cb_bctiendo" runat="server" /></td>
                                                <td>
                                                    <asp:Label ID="_1lb_ngaybctiendo" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>6. 01 Phiếu nhận xét người hướng dẫn</td>
                                                <td>
                                                    <asp:CheckBox AutoPostBack="true" OnCheckedChanged="_1cb_luanvan_CheckedChanged" ID="_1cb_phieunx" runat="server" /></td>
                                                <td>
                                                    <asp:Label ID="_1lb_ngayphieunx" runat="server" /></td>
                                            </tr>

                                        </table>
                                    </div>
                                </div>
                                <hr />
                                <div class="card">
                                    <div class="card-header font-weight-bold">HỒ SƠ TRƯỚC KHI BẢO VỆ</div>
                                    <div class="card-body">
                                        <table class="table table-sm table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Hồ sơ</th>
                                                    <th style="width: 100px;">Tình trạng</th>
                                                    <th style="width: 180px;">Ngày xác nhận</th>
                                                </tr>
                                            </thead>
                                            <tr>
                                                <td>1. 06 Quyển luận văn/ luận án</td>
                                                <td>
                                                    <asp:CheckBox  ID="_2cb_6qlv" runat="server" OnCheckedChanged="_2cb_6qlv_CheckedChanged" AutoPostBack="true" /></td>
                                                <td>
                                                    <asp:Label ID="_2lb_6qlv" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>2. 01 Bằng tốt nghiệp (photo công chứng)</td>
                                                <td>
                                                    <asp:CheckBox ID="_2cb_bangtn" runat="server" OnCheckedChanged="_2cb_6qlv_CheckedChanged" AutoPostBack="true" /></td>
                                                <td>
                                                    <asp:Label ID="_2lb_bangtn" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>3. 01 Ngoại ngữ (Chứng chỉ: CN - NNA)</td>
                                                <td>
                                                    <asp:CheckBox ID="_2cb_ccnn" runat="server" OnCheckedChanged="_2cb_6qlv_CheckedChanged" AutoPostBack="true" /></td>
                                                <td>
                                                    <asp:Label ID="_2lb_ccnn" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>4. 01 Phiếu nhận xét người hướng dẫn</td>
                                                <td>
                                                    <asp:CheckBox ID="_2cb_phieunx" runat="server" OnCheckedChanged="_2cb_6qlv_CheckedChanged" AutoPostBack="true" /></td>
                                                <td>
                                                    <asp:Label ID="_2lb_phieunx" runat="server" /></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <hr />
                                <div class="card">
                                    <div class="card-header font-weight-bold">HỒ SƠ SAU KHI BẢO VỆ</div>
                                    <div class="card-body">
                                        <table class="table table-sm table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Hồ sơ</th>
                                                    <th style="width: 100px;">Tình trạng</th>
                                                    <th style="width: 180px;">Ngày xác nhận</th>
                                                </tr>
                                            </thead>
                                            <tr>
                                                <td>1. 01 Quyển luận văn/ luận án hoàn chỉnh</td>
                                                <td>
                                                    <asp:CheckBox ID="_3cb_lv" runat="server" AutoPostBack="true" OnCheckedChanged="_3cb_lv_CheckedChanged" /></td>
                                                <td>
                                                    <asp:Label ID="_3lb_lv" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>2. 01 Bản tường trình nội dung chỉnh sửa</td>
                                                <td>
                                                    <asp:CheckBox ID="_3cb_noidungsua" runat="server" AutoPostBack="true" OnCheckedChanged="_3cb_lv_CheckedChanged" /></td>
                                                <td>
                                                    <asp:Label ID="_3lb_noidungsua" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>3. 01 Biên bản hội đồng bảo vệ</td>
                                                <td>
                                                    <asp:CheckBox ID="_3cb_hdbv" runat="server" AutoPostBack="true" OnCheckedChanged="_3cb_lv_CheckedChanged" /></td>
                                                <td>
                                                    <asp:Label ID="_3lb_hdbv" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>4. 01 Bản nhận xét các thành viên hội đồng (bản photo)</td>
                                                <td>
                                                    <asp:CheckBox ID="_3cb_nxhd" runat="server" AutoPostBack="true" OnCheckedChanged="_3cb_lv_CheckedChanged" /></td>
                                                <td>
                                                    <asp:Label ID="_3lb_nxhd" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>5. 01 Phiếu xác nhận của người hướng dẫn</td>
                                                <td>
                                                    <asp:CheckBox ID="_3cb_xnhd" runat="server" AutoPostBack="true" OnCheckedChanged="_3cb_lv_CheckedChanged" /></td>
                                                <td>
                                                    <asp:Label ID="_3lb_xnhd" runat="server" /></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <hr />
                                <div class="card">
                                    <div class="card-header font-weight-bold">HỒ SƠ TỐT NGHIỆP</div>
                                    <div class="card-body">
                                        <table class="table table-sm table-bordered">
                                            <thead>
                                                <tr>
                                                    <th >Hồ sơ</th>
                                                    <th style="width:100px;" >Tình trạng</th>
                                                    <th style="width:180px;">Ngày xác nhận</th>
                                                </tr>
                                            </thead>
                                            <tr>
                                                <td>1. 01 Phiếu đề nghị xét tốt nghiệp</td>
                                                <td>
                                                    <asp:CheckBox ID="_4cb_xettn" runat="server" AutoPostBack="true" OnCheckedChanged="_4cb_xettn_CheckedChanged" /></td>
                                                <td>
                                                    <asp:Label ID="_4lb_xettn" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>2. 01 Phiếu nộp luận văn luận án</td>
                                                <td>
                                                    <asp:CheckBox ID="_4cb_noplv" runat="server" AutoPostBack="true" OnCheckedChanged="_4cb_xettn_CheckedChanged" /></td>
                                                <td>
                                                    <asp:Label ID="_4lb_noplv" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>3. 01 Chứng chỉ ngoại ngữ (photo công chứng)</td>
                                                <td>
                                                    <asp:CheckBox ID="_4cb_ccnn" runat="server" AutoPostBack="true" OnCheckedChanged="_4cb_xettn_CheckedChanged" /></td>
                                                <td>
                                                    <asp:Label ID="_4lb_ccnn" runat="server" /></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal_gmail" tabindex="-1" role="dialog"
    aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-primary">Quản lý Gmail SĐH</h4>
            </div>
            <div class="modal-body text-center">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        
                        <div class="container">
                            <div class="row">
                                <div class="col-lg">
                                    Danh sách
                                    <asp:DropDownList runat="server" ID="dr_Gmail" CssClass="form-control form-control-sm select" AutoPostBack="true" OnSelectedIndexChanged="dr_Gmail_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg">
                                    Gmail
                            <asp:TextBox runat="server" placeholder="Gmail" ID="txt_gmail_sdh" CssClass="form-control form-control-sm" />
                                </div>
                                <div class="col-lg">
                                    API KEY
                                    <asp:TextBox runat="server" placeholder="API KEY" ID="txt_api_key" TextMode="Password" CssClass="form-control form-control-sm" />
                                </div>
                                <div class="col-lg">
                                    Thực hiện
                                    <div class="form-inline justify-content-center">
                                        <asp:LinkButton title="Thêm mới" ID="new_gmail" OnClick="new_gmail_Click" CssClass="btn btn-primary fa fa-google-plus btn-sm" runat="server" />
                                        <asp:LinkButton title="Lưu thay đổi" ID="btn_save_gmail" OnClick="btn_save_gmail_Click" CssClass="btn btn-success fa fa-save btn-sm mr-2 ml-2" runat="server" />
                                        <asp:LinkButton title="Xóa" ID="btn_delete_gmail" OnClick="btn_delete_gmail_Click" CssClass="btn btn-danger fas fa-trash-alt btn-sm" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class="row mb-2">
                                <div class="col-lg">
                                    <asp:DropDownList ID="dr_recivers" OnSelectedIndexChanged="dr_recivers_SelectedIndexChanged" CssClass="select" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg">
                                    <asp:TextBox runat="server" ID="txt_email_reciver" placeholder="Email nhận" CssClass="form-control form-control-sm mb-2"/>
                                    <asp:TextBox runat="server" ID="txt_title_reciver" placeholder="Title" CssClass="form-control form-control-sm mb-2"/>
                                </div>
                            </div>
                            <div>
                                <div class="col-lg ">
                                    <asp:LinkButton Text="Thêm người nhận" OnClick="btn_them_reciver_Click" CssClass="btn btn-primary" ID="btn_them_reciver" runat="server" />
                                    <asp:LinkButton Text="Lưu thay đổi" OnClick="btn_luu_reciver_Click" CssClass="btn btn-success" ID="btn_luu_reciver" runat="server" />
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
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
            function click_view_export() {
                document.getElementById('<%= view_export_pdf.ClientID %>').click();
            }
            function openModalalert(texttb) {
                $('#Modalalert').modal({ backdrop: 'static' });
                document.getElementById('lbtb').innerHTML = texttb;
            }
            function post_(id) {
                __doPostBack(id.name, "");
                return false;
            }
            function openModal_hshv() {
                $('#modal_hshv').modal();
            }
            function disable_button(buttonId) {
                var button = buttonId;

                if (button) {
                    button.disabled = true;
                    setTimeout(function () {
                        button.disabled = false;
                    }, 5000);
                }
            }
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
