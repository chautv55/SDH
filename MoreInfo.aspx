<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="MoreInfo.aspx.cs" Inherits="SDH_VICTORY.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col">
        </div>
    </div>
    <div class="row">
        <div class="col">
            <asp:ListView runat="server" ID="lv_tb" ItemPlaceholderID="pl_tb">
                <LayoutTemplate>
                    <div class="card">
                        <div class="card-header">
                            <h3 class="">Danh sách</h3>
                        </div>
                        <div class="card-body">
                            <ol>
                                <asp:PlaceHolder runat="server" ID="pl_tb"></asp:PlaceHolder>
                            </ol>
                        </div>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <li>
                        <asp:Label Text='<%# DateTime.Parse( Eval("ngaytao").ToString()).ToString("dd/MM/yyyy") %>' Font-Size="Small" ID="ngaytb" Font-Italic="true" runat="server" />
                        <asp:LinkButton Text='<%# Eval("header") %>' Font-Size="Medium" OnClick="btn_click_link_Click" id="btn_click_link" CommandArgument='<%# Eval("id") %>' CssClass="linkbutton" runat="server" />
                    </li>
                </ItemTemplate>
            </asp:ListView>
            
        </div>
    </div>
</asp:Content>
