using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListStudents : System.Web.UI.UserControl
{
    public event EventHandler EditEvent;
    SystemUserDetails user;
    Service schoolsApi = new Service();
    Bussinesslogic bll = new Bussinesslogic();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            user = Session["User"] as SystemUserDetails;
            Session["IsError"] = null;

            //Session is invalid
            if (user == null)
            {
                Response.Redirect("Default.aspx?MSG=SESSION HAS EXPIRED");
            }
            else if (IsPostBack)
            {

            }
            else
            {
                LoadData();
            }
        }
        catch (Exception ex)
        {
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadData()
    {
        bll.LoadSchoolsIntoDropDown(user, ddSchools);
        bll.LoadDataIntoDropDownALL("GetClassesForDropDown", new string[] { ddSchools.SelectedValue }, ddClasses);
        //SearchDb();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            SearchDB();
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true);
        }
    }

    private void SearchDB()
    {
        string[] searchParams = GetSearchParameters();
        DataTable dt = bll.SearchTable("SearchStudentsTable", searchParams);
        if (dt.Rows.Count > 0)
        {
            dataGridResults.DataSource = dt;
            dataGridResults.DataBind();
            string msg = "Found " + dt.Rows.Count + " Records Matching Search Criteria";
            Multiview2.SetActiveView(resultView);
            bll.ShowMessage(lblmsg, msg, false, Session);
        }
        else
        {
            dataGridResults.DataSource = null;
            dataGridResults.DataBind();
            Multiview2.SetActiveView(EmptyView);
            string msg = "No Records Found Matching Search Criteria";
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }

    private string[] GetSearchParameters()
    {
        List<string> all = new List<string>();
        string name = ddSchools.SelectedValue;
        string StudentId = txtStudentId.Text;
        all.Add(name);
        all.Add(ddClasses.SelectedValue);
        all.Add(StudentId);
        return all.ToArray();
    }

    protected void dataGridResults_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            GridView grid = sender as GridView;
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid.Rows[index];
            string studentID = row.Cells[1].Text;
            string schoolCode= ddSchools.SelectedValue;

            Result result = SaveStudentsUserControl.LoadEntityDataForEdit(studentID,schoolCode);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                string msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, true);
                return;
            }

            MultiView1.SetActiveView(EditStudentsView);

        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true);
        }
    }

    protected void dataGridResults_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            CheckBox ChkBoxHeader = (CheckBox)dataGridResults.HeaderRow.FindControl("chkboxSelectAll");
            foreach (GridViewRow row in dataGridResults.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("CheckBox");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }

    protected void btnPrintIds_Click(object sender, EventArgs e)
    {
        try
        {
            List<Student> IdsToPrint = new List<Student>();
            //loop thru the rows
            foreach (GridViewRow row in dataGridResults.Rows)
            {
                //for each row get the checkbox attached
                CheckBox ChkBox = (CheckBox)row.FindControl("CheckBox");

                //has user ticked the box
                if (ChkBox.Checked)
                {
                    //if this row is not the header row
                    if (row.RowType != DataControlRowType.Header)
                    {
                        Student std = new Student();
                        std.SchoolCode = ddSchools.SelectedValue;
                        std.StudentNumber = row.Cells[1].Text.Trim();
                        IdsToPrint.Add(std);
                    }
                }
            }

            Session["IdsToPrint"] = IdsToPrint;
            Response.Redirect("~/PrintStudentId.aspx");
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true);
        }
    }
}