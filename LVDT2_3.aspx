<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="LVDT2_3.aspx.cs" Inherits="SDH_VICTORY.LVDT2_3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div class="card border-primary">
                <div class="card-body">
                    <div class="container">
                        <h2 class="mb-4">PHIẾU ĐĂNG KÝ CÔNG NHẬN VÀ CHUYỂN ĐỔI TÍN CHỈ HỌC PHẦN</h2>
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
                                <div class="form-group">
                                    <asp:Repeater runat="server" ID="rptControls" OnItemDataBound="rptControls_ItemDataBound">
                                        <HeaderTemplate>
                                            <table class="table table-sm table-bordered table-hover">
                                                <tr class="text-center">
                                                    <th>STT</th>
                                                    <th>Tên học phần đã tích lũy</th>
                                                    <th>Số TC/ ĐVHT</th>
                                                    <th>Điểm</th>
                                                    <th>Học phần tương đương
                                                        <br>
                                                        thay thế đăng ký chuyển đổi </th>
                                                    <th>Số TC
                                                        <br>
                                                        tương đương</th>
                                                </tr>
                                        </HeaderTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td style="width: 5%; text-align: center; align-content: center">
                                                    <asp:Label ID="lblSTT" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTenHocPhan" CssClass="form-control" runat="server" placeholder="Tên học phần đã tích lũy"></asp:TextBox>
                                                </td>
                                                <td width="10%">
                                                    <asp:TextBox ID="txtSoTC" TextMode="Number" runat="server" CssClass="form-control" placeholder="Số TC"></asp:TextBox>
                                                </td>
                                                <td width="10%">
                                                    <asp:TextBox ID="txtDiem" TextMode="Number" runat="server" CssClass="form-control" placeholder="Điểm"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtHocPhanTuongDuong" CssClass="form-control" runat="server" placeholder="Học phần tương đương"></asp:TextBox>
                                                </td>
                                                <td width="10%">
                                                    <asp:TextBox ID="txtSoTCTuongDuong" TextMode="Number" CssClass="form-control" runat="server" placeholder="Số TC"></asp:TextBox>
                                                </td>
                                            </tr>

                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:LinkButton ID="btnAddRow" runat="server" CssClass="btn btn-success" Text="Thêm Hàng" OnClick="btnAddRow_Click" />
                                </div>
                            </div>
                        </div>
                        <asp:Button ID="SubmitButton" OnClientClick="Modalguihs();" OnClick="SubmitButton_Click" runat="server" Text="Nộp hồ sơ" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>

</asp:Content>
