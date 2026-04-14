<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Index.Master" AutoEventWireup="true" CodeBehind="HoiDong.aspx.cs" Inherits="SDH_VICTORY.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="text-center">
        <asp:Label Text="" ID="title" runat="server" /></h2>
    <div class="row">
        <div class="col-lg">

        </div>
        <div class="col-lg">
            <asp:DropDownList ID="dr_nam" AutoPostBack="true" OnSelectedIndexChanged="dr_nam_SelectedIndexChanged" CssClass="select" runat="server">
            </asp:DropDownList>
</div>
        <div class="col-lg">

</div>
    </div>
    <div style="overflow:auto;min-width:720px">
        <asp:ListView ID="lv_hienthi" runat="server" OnItemDataBound="lv_hienthi_ItemDataBound" ItemPlaceholderID="pl_">
            <LayoutTemplate>
                <table id="myTable" class="table table-sm table-bordered">
                    <thead>
                        <tr >
                            <th class="text-center">STT</th>
                            <th class="text-center">Ngành</th>
                            <th class="text-center">Ngày</th>
                            <th class="text-center">Thời gian</th>
                            <th class="text-center">Địa điểm</th>
                            <th class="text-center">Hội đồng</th>
                            <th class="text-center">Ghi chú</th>
                        </tr>
                    </thead>
                    <asp:PlaceHolder ID="pl_" runat="server"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <asp:Label Text="" ID="lb_hienthi" runat="server" />
            </ItemTemplate>
        </asp:ListView>
    </div>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script>
    $(document).ready(function () {
        // Khởi tạo DataTable với bộ lọc ở từng cột
        $('#myTable').DataTable({
            initComplete: function () {
                this.api().columns().every(function () {
                    var column = this;
                    var select = $('<select class="form-control form-control-sm"><option value=""></option></select>')
                        .appendTo($(column.header())) // Thêm dropdown vào header
                        .on('change', function () {
                            var val = $.fn.dataTable.util.escapeRegex($(this).val());
                            column.search(val ? '^' + val + '$' : '', true, false).draw();
                        });

                    // Lấy dữ liệu duy nhất từ cột để bỏ vào dropdown
                    column.data().unique().sort().each(function (d, j) {
                        select.append('<option value="' + d + '">' + d + '</option>')
                    });

                    // Ngăn chặn sự kiện click sort khi bấm vào dropdown
                    $(select).click(function (e) { e.stopPropagation(); });
                });
            }
        });
    });
</script>
</asp:Content>
