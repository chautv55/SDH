<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="LVDT2_4.aspx.cs" Inherits="SDH_VICTORY.LVDT2_4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card border-primary">
        <div class="card-body">
            <div class="container">
                <h2 class="mb-4">GIẤY ĐỀ NGHỊ NGHỈ HỌC TẠM THỜI (HOẶC GIA HẠN HỌC TẬP)</h2>
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
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>

                                <div class="form-group">
                                    <label>Thời gian nghỉ</label><span class="auto-style1" style="color: #FF0000">*</span>
                                    <div class="row">
                                        <div class="col-lg">
                                            <asp:DropDownList runat="server" CssClass="form-control " ID="dr_loainghi">
                                                <asp:ListItem Text="Thạc sĩ" />
                                                <asp:ListItem Text="Tiến sĩ" />
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg">
                                            <asp:TextBox ID="FROM" onblur="post_(this);" OnTextChanged="FROM_TextChanged" runat="server" TextMode="Date" required="true" CssClass="form-control" />
                                            <%--<asp:TextBox ID="TO" onblur="post_(this);" OnTextChanged="FROM_TextChanged" runat="server" TextMode="Date" required="true" CssClass="form-control" />--%>
                                        </div>
                                        <div class="col-lg">
                                            <asp:Label Text="" ID="lb_sum" runat="server" />
                                        </div>
                                    </div>
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
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
                            <asp:TextBox ID="HS_kem" runat="server" CssClass="form-control" placeholder="Tên hồ sơ đính kèm " />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="">Ảnh chuyển khoản</label>
                            <asp:FileUpload id="file_ck" required="true" runat="server" accept=".jpg,.jpeg,.png" />
                        </div>
                    </div>
                </div>
                <div>
                <asp:Button ID="SubmitButton" OnClientClick="Modalguihs();" OnClick="SubmitButton_Click" runat="server" Text="Nộp hồ sơ" CssClass="btn btn-primary" />
                </div>
                <div>
                <img src="Data/img/ck_sdh.jpg" style="width:70%" />
                </div>
            </div>
        </div>
    </div>
            
</asp:Content>
