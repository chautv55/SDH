<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="DNHBSKT.aspx.cs" Inherits="SDH_VICTORY.DNHBSKT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card border-primary">
    <div class="card-body">
        <div class="container">
            <h2 class="mb-4">PHIẾU ĐỀ NGHỊ HỌC BỔ SUNG KIẾN THỨC</h2>
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
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-lg">
                            <label for="">Ngành đang học</label>
                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="dr_nganh_parent_SelectedIndexChanged" CssClass="select" ID="dr_nganh_parent" DataSourceID="nganh" DataTextField="ten_nganh"
                                DataValueField="id">
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="nganh" ConnectionString='<%$ ConnectionStrings:SDHConnectionString %>' SelectCommand="SELECT * FROM [Nganh] ORDER BY [ten_nganh]"></asp:SqlDataSource>
                        </div>
                        <div class="col-lg">
                            <label for="">Ngành tốt nghiệp</label>
                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="dr_nganh_parent_SelectedIndexChanged" CssClass="select" ID="dr_nganh_bskt" DataSourceID="nganh" DataTextField="ten_nganh"
                                DataValueField="id">
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg">
                            <asp:CheckBoxList AutoPostBack="true" OnSelectedIndexChanged="cb_monhoc_SelectedIndexChanged" runat="server" ID="cb_monhoc" RepeatLayout="Table">
                            </asp:CheckBoxList>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-lg">
                            <asp:Label ID="lb_hocphi" runat="server" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <div class="row mt-2">
                <div class="col-lg">
                    <asp:Label Text="Hóa đơn thanh toán" runat="server" /><span class="auto-style1" style="color: #FF0000">*</span>
                    <asp:FileUpload accept=".pdf,.jpg,.jpeg,.png" AllowMultiple="true" runat="server" ID="file_hd" />
                </div>
            </div>
            <hr />
            <asp:Button ID="SubmitButton" OnClientClick="Modalguihs();" OnClick="SubmitButton_Click" runat="server" Text="Nộp hồ sơ" CssClass="btn btn-primary" />
        </div>
    </div>
</div>

</asp:Content>
