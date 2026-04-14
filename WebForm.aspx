<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="SDH_VICTORY.WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="card">
                <div class="card-body">
                        <asp:PlaceHolder runat="server" ID="pl_control_form" />
                    <div class="row">
                        <div class="col-lg">
                            <asp:Button Text="Gửi thông tin" ID="btn_summit" CssClass="btn btn-sm btn-primary mt-2" OnClick="btn_summit_Click" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers   >
            <asp:PostBackTrigger ControlID="btn_summit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
