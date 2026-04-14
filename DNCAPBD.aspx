<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="DNCAPBD.aspx.cs" Inherits="SDH_VICTORY.DNCAPBD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card border-primary">
        <div class="card-body">
            <div class="container">
                <div>

                </div>
                <div class="text-center">
                <h2 class="mb-4">PHIẾU ĐỀ NGHỊ CẤP BẢNG ĐIỂM/PHỤ LỤC VĂN BẰNG</h2>
                </div>
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
                    <div class="col-lg">
                        <label for="Email">Nội dung xin xác nhận</label>
                        <asp:TextBox ID="txt_xinxn" required="true" runat="server" CssClass="form-control" placeholder="Nội dung xin xác nhận"></asp:TextBox>
                    </div>

                </div>
                <asp:Button ID="SubmitButton" OnClientClick="Modalguihs();" OnClick="SubmitButton_Click" runat="server" Text="Nộp hồ sơ" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</asp:Content>
