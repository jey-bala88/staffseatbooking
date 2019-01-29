var BookedListPage = React.createClass({
  getInitialState: function() {
      return {
        booked_data: [],
        isViewBookedSeatDeatilsPage: false,
        booked_seat_details: {},
        current_user: "",
      };
  },
  loadData: function(){
    $.ajax({
      url: '/booking_seat',
      method: 'GET',
      success: function(response){
        this.setState({
          booked_data: response.data.content,
          current_user: response.data.current_user_name
        });
        $('#booked_list_table_id').DataTable({
          "bAutoWidth": false,
          "bDestroy": true,
          "order": [],
          "fnDrawCallback": function() {
            },
        });
      }.bind(this)
    })
  },
  componentDidMount: function(){
    this.loadData();
  },
  viewDetails: function(data_id){
    $.ajax({
      url: '/booking_seat/'+data_id,
      method: 'GET',
      success: function(response){
        alert(response)
        this.setState({
          //booked_seat_details: response.data.data,
          isViewBookedSeatDeatilsPage: true
        });
      }.bind(this)
    });
  },
  render() {
    var userlist= this.state.booked_data.map((data,index) => {
      return (
          <tr key={index}>
            <td>{data.user_name}</td>
            <td>{data.desk}</td>
            <td>{data.date_range}</td>
            <td><a style={{fontSize: "smaller"}} href={'/booking_seat/'+data.id} className='btn btn-primary'>View</a></td>
          </tr>
      )
    });
    return ( 
      <div>
        <h1> {'Welcome, '+this.state.current_user}   </h1>
        <a className="btn btn-default" href="/booking_seat/new">Book New Seat </a>
        <a className="btn btn-default" href="/view_user_bookings">View Own Bookings </a>
        <table border="1" className="table table-hover table-condensed" id="booked_list_table_id" style={{whiteSpace: "pre-wrap"}}>
          <thead>
            <tr>
              <th>Name</th>
              <th>Desk</th>
              <th>From To </th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
           {userlist}
          </tbody>
        </table>
        {this.state.isViewBookedDeatilsPage ? <ViewBookedUserDetails booked_seat_details={this.state.booked_seat_details}/> : null}
      </div>
    )
  }
});