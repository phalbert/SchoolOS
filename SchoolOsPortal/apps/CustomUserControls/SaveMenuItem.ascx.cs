using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_SaveMenuItem : System.Web.UI.UserControl
{
    public event EventHandler SaveCompleted;
    Bussinesslogic bll = new Bussinesslogic();
    SystemUserDetails user = new SystemUserDetails();
    Service schoolApi = new Service();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            user = Session["User"] as SystemUserDetails;
            Session["IsError"] = null;
            string Id = Request.QueryString["BankCode"];

            //Session is invalid
            if (user == null)
            {
                Response.Redirect("Default.aspx?Msg=SESSION HAS EXPIRED");
            }
            //Page posting back user request
            else if (IsPostBack)
            {

            }
            //Load Old details
            else if (!string.IsNullOrEmpty(Id))
            {
                LoadEntityData(Id);
            }
            //First time Request
            else
            {
                LoadData();
            }
        }
        catch (Exception ex)
        {
            //something is wrong...show the error
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadData()
    {
        btnSubmit.Visible = true;
        btnEdit.Visible = false;

        bll.LoadSchoolsIntoDropDown(user, ddSchools);
        bll.LoadDataIntoDropDown("GetSubLinksForDropDown", new string[] { ddSchools.SelectedValue }, ddSubLinks);
        bll.LoadDataIntoDropDown("GetMainLinksForDropDown", new string[] { ddSchools.SelectedValue }, ddMainLinks);
    }

    private void LoadEntityData(string id)
    {
        btnSubmit.Visible = false;
        btnEdit.Visible = true;
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string msg = "";
            List<InterLinkClass.PegPaySchoolsApi.MenuItem> Items = GetObject();

            foreach (InterLinkClass.PegPaySchoolsApi.MenuItem item in Items)
            {
                Result result = schoolApi.SaveMenu(item);

                if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
                {
                    msg = "FAILED: " + result.StatusDesc;
                    bll.ShowMessage(lblmsg, msg, false, Session);
                    return;
                }
            }

            msg = "LINKS SAVED SUCCESSFULLY";
            bll.ShowMessage(lblmsg, msg, false, Session);

            if (SaveCompleted != null)
            {
                MyEventArgs eventArgs = new MyEventArgs();

                //Pass on msg
                Session["ExternalMsg"] = msg;

                SaveCompleted(sender, eventArgs);
            }
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private List<InterLinkClass.PegPaySchoolsApi.MenuItem> GetObject()
    {
        List<InterLinkClass.PegPaySchoolsApi.MenuItem> all = ViewState["MenuItems"] as List<InterLinkClass.PegPaySchoolsApi.MenuItem>;
        if (all == null)
        {
            throw new Exception("Please Select a MainLink and SubLink");
        }
        return all;
    }


    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void btnAddSubLink_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddMainLinks.SelectedValue == "")
            {
                return;
            }
            List<InterLinkClass.PegPaySchoolsApi.MenuItem> menuItems = ViewState["MenuItems"] as List<InterLinkClass.PegPaySchoolsApi.MenuItem>;
            if (menuItems == null)
            {
                AddMenuItemToViewState(menuItems);
            }

            InterLinkClass.PegPaySchoolsApi.MenuItem menuItem = menuItems.Find(i => i.mainLink.MainLinkCode == ddMainLinks.SelectedValue);
            if (menuItem == null)
            {
                AddMenuItemToViewState(menuItems);
            }

            menuItem = menuItems.Find(i => i.mainLink.MainLinkCode == ddMainLinks.SelectedValue);
            List<SubLink> subLinks = new List<SubLink>();
            subLinks.AddRange(menuItem.subLinks);
            subLinks.Add(new SubLink() { SubLinkCode = ddSubLinks.SelectedValue, SubLinkName = ddSubLinks.Text });
            menuItem.subLinks = subLinks.ToArray();
            ViewState["MenuItems"] = subLinks;

        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void ddMainLinks_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            List<InterLinkClass.PegPaySchoolsApi.MenuItem> menuItems = ViewState["MenuItems"] as List<InterLinkClass.PegPaySchoolsApi.MenuItem>;
            if (menuItems == null)
            {
                AddMenuItemToViewState(menuItems);
                return;
            }

            InterLinkClass.PegPaySchoolsApi.MenuItem menuItem = menuItems.Find(i => i.mainLink.MainLinkCode == ddMainLinks.SelectedValue);
            if (menuItem == null)
            {
                AddMenuItemToViewState(menuItems);
                return;
            }


        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void AddMenuItemToViewState(List<InterLinkClass.PegPaySchoolsApi.MenuItem> menuItems)
    {
        InterLinkClass.PegPaySchoolsApi.MenuItem std = new InterLinkClass.PegPaySchoolsApi.MenuItem();
        std.mainLink = new MainLink();
        std.mainLink.MainLinkCode = ddMainLinks.SelectedValue;
        std.mainLink.MainLinkName = ddMainLinks.Text;
        std.subLinks = new SubLink[] { };
        menuItems.Add(std);
        ViewState["MenuItems"] = menuItems;
        return;
    }
}