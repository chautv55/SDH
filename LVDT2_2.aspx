<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="LVDT2_2.aspx.cs" Inherits="SDH_VICTORY.LVDT2_2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card border-primary">
        <div class="card-body">
            <div class="container">
                <h2 class="mb-4">PHIẾU ĐĂNG KÝ XÉT MIỄN GIẢM HỌC PHẦN TRIẾT HỌC</h2>
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
                            <label for="Email">Lý do</label><span class="auto-style1" style="color: #FF0000">*</span>
                            <asp:TextBox ID="Lydo" runat="server" required="true" TextMode="MultiLine" CssClass="form-control" placeholder="Lý do" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="Email">Danh sách tên hồ sơ đính kèm</label>
                            <asp:TextBox id="HS_kem" runat="server"  CssClass="form-control" placeholder="Tên hồ sơ đính kèm " />
                        </div>
                    </div>
                </div>
                <asp:Button ID="SubmitButton" OnClientClick="Modalguihs();" OnClick="SubmitButton_Click" runat="server" Text="Nộp hồ sơ" CssClass="btn btn-primary"  />
            </div>
        </div>
    </div>
</asp:Content>
