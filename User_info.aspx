<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="User_info.aspx.cs" Inherits="SDH_VICTORY.User_info1" %>
<%@ Register Src="~/DynamicData/FieldTemplates/INFO_USER.ascx" TagPrefix="FORM" TagName="Form_DATA_USER" %>
<%@ Register Src="~/DynamicData/FieldTemplates/USER_STUDY.ascx" TagPrefix="FORM" TagName="USER_STUDY" %>
<%@ Register Src="~/DynamicData/FieldTemplates/User_DVTT.ascx" TagPrefix="FORM" TagName="User_DVTT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container ">
                <div class="card">
                    <div class="card-body">
                        <ul class="mt-2 mb-2 " style="list-style: decimal; font-size: large">
                            <li class="mt-2 mb-2">
                                <asp:LinkButton Text="Thông tin cá nhân" CssClass="mt-2" ID="btn_canhan" OnClick="btn_canhan_Click" runat="server" />
                            </li>
                            <li class="mt-2 mb-2">
                                <asp:LinkButton Text="Thông tin học tập" CssClass="mt-2" ID="btn_hoctap" OnClick="btn_hoctap_Click" runat="server" />
                            </li>
                            <li class="mt-2 mb-2">
                                <asp:LinkButton Text="Hồ sơ trực tuyến" CssClass="mt-2" ID="btn_hs_DVTT" OnClick="btn_hs_DVTT_Click" runat="server" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row mt-2" id="form_user" runat="server" visible="false">
                <div class="col-lg">
                    <FORM:Form_DATA_USER runat="server" ID="Control_Form_User" />
                </div>
            </div>
            <div class="row mt-2" runat="server" id="form_hoctap" visible="false">
                <div class="col-lg">
                    <FORM:USER_STUDY runat="server" ID="USER_STUDY" />
                </div>
            </div>
            <div class="row mt-2" id="user_dv" runat="server" visible="false">
                <div class="col-lg">
                    <FORM:User_DVTT runat="server" ID="Form_user_DVTT" />
                </div>
            </div>
            <script>
                // Add the following code if you want the name of the file appear on select
                $(".custom-file-input").on("change", function () {
                    var fileName = $(this).val().split("\\").pop();
                    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
                });
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>
