<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SDH_VICTORY.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="content"  runat="server">
        <div class="" id="slide_header" runat="server">
            <div class=" d-flex  justify-content-center">
                <div class="w-100">
                    <div id="slide" class="carousel slide" style="max-height:320px" data-ride="carousel">
                        <asp:PlaceHolder runat="server" ID="pl_slide" />
                        <a class="carousel-control-prev" href="#slide" data-slide="prev">
                            <div style="border: 1px solid; border-radius: 50%; width: 30px; height: 30px; display: flex; justify-content: center; align-items: center; background-color: gray;">
                                <span class="carousel-control-prev-icon"></span>
                            </div>
                        </a>
                        <a class="carousel-control-next" href="#slide" data-slide="next">
                            <div style="border: 1px solid; border-radius: 50%; width: 30px; height: 30px; display: flex; justify-content: center; align-items: center; background-color: gray;">
                                <span class="carousel-control-next-icon"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <asp:ListView ID="lv_mid" OnItemDataBound="lv_mid_ItemDataBound" runat="server">
                    <ItemTemplate>
                        <section class="about" data-aos="fade-up">
                            <div class="container">
                                <asp:ListView runat="server" ID="LV_ITEM" ItemCount="5" ItemPlaceholderID="pl_nd_tb" OnItemDataBound="lv_thongbao_ItemDataBound">
                                    <LayoutTemplate>
                                        <div class="">
                                            <div class="mb-2 title-custom border-bottom-tvu" style="">
                                                <h3>
                                                    <asp:Label Text="" ID="lb_head" runat="server" /></h3>
                                            </div>
                                            <div class="container">
                                                <asp:PlaceHolder ID="pl_nd_tb" runat="server"></asp:PlaceHolder>
                                                <asp:LinkButton Text="Xem thêm..." ID="btn_show_more" OnClick="btn_show_more_Click" runat="server" />
                                            </div>
                                        </div>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-lg">
                                                <div class="">
                                                    <asp:Label ID="lb_new" Text="NEW" Font-Italic="true" CssClass="badge badge-danger text-warning" Visible="false" runat="server" />
                                                    <span class="fas fa-angle-double-right"></span>
                                                    <asp:LinkButton CssClass="linkbutton" Font-Underline="false" ID="btn_link_tb" 
                                                        Text='<%#  Eval("header") %>' CommandArgument='<%# Eval("id") %>' OnClick="btn_link_tb_Click" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-sm-2 d-flex">
                                                <asp:Label Text="" ID="ngaytb" Font-Italic="true" Font-Size="Small" CssClass="ml-auto" runat="server" />
                                            </div>
                                        </div>
                                        <hr style="border-style: dashed;" />
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </section>
                    </ItemTemplate>
                </asp:ListView>

            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
    
</asp:Content>
