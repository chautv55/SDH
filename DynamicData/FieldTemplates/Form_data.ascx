<%@ Control Language="C#" CodeBehind="Form_data.ascx.cs" Inherits="SDH_VICTORY.DynamicData.FieldTemplates.Form_data" %>

<asp:UpdatePanel runat="server">
    <ContentTemplate>

<div class="container">

    <div class="d-flex align-items-center justify-content-center">
        <asp:Label Text="" ID="lb_hoso" Font-Bold="true" Font-Size="Larger" runat="server" />
    </div>
    <div class="d-flex align-items-center justify-content-center">
        <asp:RadioButtonList runat="server" RepeatLayout="Flow" CssClass="" OnSelectedIndexChanged="rd_trangthai_SelectedIndexChanged" RepeatDirection="Horizontal" ID="rd_trangthai" AutoPostBack="true">
            <asp:ListItem Text="Chưa duyệt" Selected="True" />
            <asp:ListItem Text="Duyệt" />
            <asp:ListItem Text="Không duyệt" />
        </asp:RadioButtonList>
    </div>
    <asp:ListView ID="lv_form_data" runat="server" ItemPlaceholderID="pl_control" OnItemUpdating="lv_form_data_ItemUpdating" OnItemDataBound="lv_form_data_ItemDataBound">
        <LayoutTemplate>
            <asp:PlaceHolder runat="server"  ID="pl_control" />
        </LayoutTemplate>
        <ItemTemplate>

            <div runat="server" id="div_item" class="table table-sm table-bordered">
                <div class="row mt-2 mb-2">
                    <div class="col-lg-1 d-flex align-items-center flex-column justify-content-between">
                        <asp:LinkButton Text="" Font-Underline="false" CssClass="far fa-check-circle mt-1 mb-1 w-100 text-center" OnClick="duyet_Click" ForeColor="Green" ID="duyet" runat="server" />
                        <asp:LinkButton Text="" Font-Underline="false" OnClick="btn_download_Click" CssClass="fa fa-download mt-1 mb-1 w-100 text-center"  ForeColor="Green" ID="btn_download" runat="server" />
                        <asp:LinkButton Text="" data-toggle="collapse" Font-Underline="false" 
                            data-target='<%# "#collapse"+ Eval("SubmissionID") %>' CssClass="fa fa-window-close-o mt-1 mb-1 w-100 text-center"  ForeColor="Red" ID="kduyet" runat="server" />
                    </div>
                    <div class="col-lg">
                        <div class="row mt-2">
                            <div class="col-lg ml-2">
                                <asp:Label Font-Bold="true" ForeColor="Black" Text="" ID="lb_user_request" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg ml-2 mt-2">
                                    <asp:Label Text="" CssClass="row" ID="lb_info_request" runat="server" />
                            </div>
                        </div>
                        <div class="row collapse" id='collapse<%# Eval("SubmissionID") %>'>
                            <div class="col-lg">
                                <asp:TextBox runat="server" CssClass="form-control form-control-sm w-100" ID="txt_lydo" placeholder="Lý do" />
                            </div>
                            <div class="col-lg-2">
                                <asp:LinkButton Text="Xác nhận" CommandArgument='<%# Eval("SubmissionID") %>' ID="btn_kduyet" OnClick="btn_kduyet_Click" CssClass="btn btn-sm btn-danger" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 d-flex align-items-center">
                        <asp:Label CssClass="ml-2 mt-2" Font-Italic="true" Font-Size="X-Small" Text="" ID="lb_ngay" runat="server" />
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
</div>
      <asp:Literal ID="Literal1" runat="server" Mode="PassThrough"></asp:Literal>  
    </ContentTemplate>
</asp:UpdatePanel>
