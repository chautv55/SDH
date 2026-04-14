<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="LVDT2_5.aspx.cs" Inherits="SDH_VICTORY.LVDT2_5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card border-primary">
        <div class="card-body">
            <div class="container">
                <h2 class="mb-4">PHIẾU ĐĂNG KÝ HỌC LẠI HỌC PHẦN</h2>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="HoTen">Họ và tên học viên<span class="auto-style1" style="color: #FF0000">*</span></label>
                            <asp:TextBox ID="HoTen" runat="server" required="true" CssClass="form-control" placeholder="Nhập Họ và tên"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="MSHV">MSHV</label><span class="auto-style1" style="color: #FF0000">*</span>
                            <asp:TextBox ID="MSHV" runat="server" required="true" CssClass="form-control" placeholder="Nhập MSHV"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="Nganh">Ngành<span class="auto-style1" style="color: #FF0000">*</span></label>
                            <asp:DropDownList runat="server" ID="dr_nganh" CssClass="select">
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-lg">
                        <div class="row">

                            <div class="col-lg">
                                <div class="form-group">
                                    <label for="Malop">Mã lớp</label><span class="auto-style1" style="color: #FF0000">*</span>
                                    <asp:TextBox ID="Malop" required="true" runat="server" CssClass="form-control" placeholder="Nhập Mã lớp"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg">
                                <div class="form-group">
                                    <label for="Khoa">Khóa</label><span class="auto-style1" style="color: #FF0000">*</span>
                                    <asp:TextBox ID="Khoa" required="true" runat="server" CssClass="form-control" placeholder="Khóa"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="Tunghoc">Từng học</label><span class="auto-style1" style="color: #FF0000">*</span>
                            <asp:TextBox ID="Tunghoc" required="true" runat="server" CssClass="form-control" placeholder="Từng học tại...."></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="DienThoai">Điện thoại</label><span class="auto-style1" style="color: #FF0000">*</span>
                            <asp:TextBox ID="DienThoai" required="true" TextMode="Phone" runat="server" CssClass="form-control" placeholder="Nhập Điện thoại"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="Email">Email</label><span class="auto-style1" style="color: #FF0000">*</span>
                            <asp:TextBox ID="Email" required="true" runat="server" CssClass="form-control" placeholder="Nhập Email" TextMode="Email"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:RadioButtonList ID="rd_loaihoc" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" CssClass="table table-sm">
                            <asp:ListItem Text="Học lại học phần"  Selected="True"/>
                            <asp:ListItem Text="Học học phần thay thế" />
                        </asp:RadioButtonList>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <asp:Repeater runat="server" ID="rptControls" OnItemDataBound="rptControls_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table table-sm table-bordered table-hover">
                                        <tr class="text-center">
                                            <th>STT</th>
                                            <th>Tên học phần đã học</th>
                                            <th>Họ và tên giảng viên</th>
                                            <th>Thời gian học</th>
                                            <th>Kết quả</th>
                                        </tr>
                                </HeaderTemplate>
                                <FooterTemplate>
                                    </table>
                                    <asp:LinkButton ID="btnAddRow" runat="server" CssClass="btn btn-success" Text="Thêm Hàng" OnClick="btnAddRow_Click" />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td style="width: 5%; text-align: center; align-content: center">
                                            <asp:Label ID="lblSTT" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTenHocPhan"  CssClass="form-control" runat="server" placeholder="Tên học phần đã học"></asp:TextBox>
                                        </td>
                                        <td >
                                            <asp:TextBox ID="txtGV"  runat="server" CssClass="form-control" placeholder="Họ và tên giảng viên"></asp:TextBox>
                                        </td>
                                        <td >
                                            <asp:TextBox ID="txtTGH" runat="server" CssClass="form-control" placeholder="Thời gian học"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtKQ" CssClass="form-control" runat="server" placeholder="Kết quả"></asp:TextBox>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="form-group">
                            <asp:Repeater runat="server" ID="rp_HPhoclai" OnItemDataBound="rptControls_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table table-sm table-bordered table-hover">
                                        <tr class="text-center">
                                            <th>STT</th>
                                            <th>HP đăng ký học lại hoặc thay thế</th>
                                            <th>Họ và tên giảng viên</th>
                                            <th>Ghi chú</th>
                                        </tr>
                                </HeaderTemplate>
                                <FooterTemplate>
                                    </table>
                        <asp:LinkButton ID="btnAddRow2" runat="server" CssClass="btn btn-success" Text="Thêm Hàng" OnClick="btnAddRow2_Click" />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td style="width: 5%; text-align: center; align-content: center">
                                            <asp:Label ID="lblSTT" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTenHocPhan"  CssClass="form-control" runat="server" placeholder="Tên học phần học"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtGV" runat="server" CssClass="form-control" placeholder="Họ và tên giảng viên"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Ghichu" CssClass="form-control" runat="server" placeholder="Ghi chú"></asp:TextBox>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <asp:Button ID="SubmitButton" OnClientClick="Modalguihs();" OnClick="SubmitButton_Click" runat="server" Text="Nộp hồ sơ" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</asp:Content>
