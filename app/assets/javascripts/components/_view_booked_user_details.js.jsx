var ViewBookedUserDetails = React.createClass({
  getInitialState: function(){
    return {
      name: "",
    };
  },
  componentDidMount: function(){
    setTimeout(function(){
      window.location.href="#openViewModal"
    }.bind(this),5)
  },
  loadTemplate: function(){
    this.props.onshowCategorieQualifiersListPage();
  },
  render(){
     return(
          <div id="openViewModal" className="modalDialog">
            <div>
              <h3> Booked user details </h3>
        	  {this.props.booked_seat_details}
            </div>
        </div>
      )
   }
 });