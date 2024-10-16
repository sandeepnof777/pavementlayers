<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div id="example" class="k-content">

        <div class="configuration k-widget k-header">
            <span class="configHead">API Functions</span>
            <ul class="options">
                <li>
                    <input id="value" type="text" class="k-textbox" />
                    <button id="set" class="k-button">Set value</button>
                </li>
                <li>
                    <button id="get" class="k-button">Get value</button>
                </li>
                <li>
                    <input id="word" value="B" class="k-textbox" />
                    <button id="search" class="k-button">Find starting with</button>
                </li>
            </ul>
        </div>

        <div id="colors">
            <label for="products">Primary color</label>
            <%= Html.Kendo().AutoComplete()
                    .Name("products")
                    .BindTo(new string[] 
                    {
                    "Red-violet",
                    "Red",
                    "Red-orange",
                    "Orange",
                    "Yellow-orange",
                    "Yellow",
                    "Yellow-green",
                    "Green",
                    "Blue-green",
                    "Blue",
                    "Blue-violet",
                    "Violet"
                    })
            %>
        </div>

        <script>
            $(document).ready(function() {
                var autocomplete = $("#products").data("kendoAutoComplete"),
                    setValue = function(e) {
                        if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode)
                            autocomplete.value($("#value").val());
                    },
                    setSearch = function(e) {
                        if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode)
                            autocomplete.search($("#word").val());
                    };

                $("#set").click(setValue);
                $("#value").keypress(setValue);
                $("#search").click(setSearch);
                $("#word").keypress(setSearch);

                $("#get").click(function() {
                    alert(autocomplete.value());
                });
            });
        </script>
        <style scoped>
            #colors {
                width: 366px;
                height: 180px;
                padding: 114px 0 0 0;
                background: url('<%= Url.Content("~/Content/web/autocomplete/palette.png") %>') transparent no-repeat right 0;
                margin: 30px 0 30px 120px;
                text-align: center;
 			}
            #colors label {
                display: block;
                color: #333;
                padding-bottom: 5px;
 			}
            #products {
                margin-right: 50px;
            }
            .configuration {
                height: 410px;
                margin-bottom: -21px;
            }
            .configuration .k-textbox {
                width: 40px;
            }
        </style>
    </div>
</asp:Content>