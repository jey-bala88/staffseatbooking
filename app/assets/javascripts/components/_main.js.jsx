var Menu = React.createClass({
  render() {
    return (
      <div>
        <ul className="nav navbar-nav navbar-right">
          <a className="btn btn-default submit" data-placement="bottom" data-original-title="Sign out" rel="nofollow" data-method="delete" href="/users/sign_out">Logout<i className="fa fa-sign-out"></i>
          </a>
        </ul>
        <BookedListPage />
      </div>
    )
  }
});
