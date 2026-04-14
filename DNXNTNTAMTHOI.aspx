<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="DNXNTNTAMTHOI.aspx.cs" Inherits="SDH_VICTORY.DNXNTNTAMTHOI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card border-primary">
    <div class="card-body">
        <div class="container">
            <h2 class="mb-4">PHIẾU ĐỀ NGHỊ XÁC NHẬN TỐT NGHIỆP TẠM THỜI</h2>
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
                    <label for="Email">Nội dung xin xác nhận</label><span class="auto-style1" style="color: #FF0000">*</span>
                    <asp:TextBox ID="txt_xinxn" required="true" runat="server" CssClass="form-control" placeholder="Nội dung xin xác nhận" ></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-lg">
                    <label for="Email">Nhận tại</label><span class="auto-style1" style="color: #FF0000">*</span>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:RadioButtonList runat="server" AutoPostBack="true" required="true" ID="rd_nhan" OnSelectedIndexChanged="rd_nhan_SelectedIndexChanged">
                                <asp:ListItem Text="Nhận tại Phòng  Đào tạo Sau đại học" />
                                <asp:ListItem Text="Gửi về địa chỉ cụ thể (Học viên sẽ chịu phí bưu cục khi nhận thư)" />
                            </asp:RadioButtonList>
                            <asp:TextBox runat="server" ID="txt_diachigui" placeholder="Địa chỉ nhận" required="true" Visible="false" CssClass="form-control mt-2 mb-2" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <asp:Button ID="SubmitButton" OnClientClick="Modalguihs();" OnClick="SubmitButton_Click" runat="server" Text="Nộp hồ sơ" CssClass="btn btn-primary" />
        </div>
    </div>
</div>
</asp:Content>
