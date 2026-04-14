<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="LVBV4_3.aspx.cs" Inherits="SDH_VICTORY.LVBV4_3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card border-primary">
        <div class="card-body">
            <div class="container">
                <h2 class="mb-4">PHIẾU ĐĂNG KÝ ĐỀ TÀI LUẬN VĂN THẠC SĨ/ĐỀ ÁN</h2>
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
                            <label for="">Ngày Sinh</label><span class="auto-style1" style="color: #FF0000">*</span>
                            <asp:TextBox ID="NgaySinh" runat="server" required="true" TextMode="Date" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="">Nơi Sinh</label><span class="auto-style1" style="color: #FF0000">*</span>
                            <asp:TextBox ID="NoiSinh" runat="server" required="true" placeholder="Nơi Sinh" CssClass="form-control" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="DonViCongTac">Đơn vị công tác</label><span class="auto-style1" style="color: #FF0000">*</span>
                            <asp:TextBox ID="DonViCongTac" required="true" runat="server" CssClass="form-control" placeholder="Nhập Đơn vị công tác"></asp:TextBox>
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
                            <label for="">Đề tài</label><span class="auto-style1" style="color: #FF0000">*</span>
                            <asp:TextBox ID="DeTai" runat="server" required="true" CssClass="form-control" placeholder="Tên Đề tài" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="">Số QĐ</label><span class="auto-style1" style="color: #FF0000">*</span>
                            <asp:TextBox ID="QD" runat="server" required="true" CssClass="form-control" placeholder="Số quyết định " />
                        </div>
                    </div>
                    <div class="col-lg">
                        <div class="form-group">
                            <label for="">Ngày QĐ</label><span class="auto-style1" style="color: #FF0000">*</span>
                            <asp:TextBox ID="NGAYQD" runat="server" required="true" TextMode="Date" CssClass="form-control"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="">Người hướng dẫn</label><span class="auto-style1" style="color: #FF0000">*</span>
                            <asp:TextBox ID="NHD" required="true" runat="server" CssClass="form-control" placeholder="Người hướng dẫn " />
                        </div>
                    </div>
                </div>
                <asp:Button ID="SubmitButton" OnClientClick="Modalguihs();" OnClick="SubmitButton_Click" runat="server" Text="Nộp hồ sơ" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</asp:Content>
