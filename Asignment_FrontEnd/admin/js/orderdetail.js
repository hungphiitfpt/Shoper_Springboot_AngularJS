const host = "http://localhost:8080/rest";
const app = angular.module("OrderDetailApp", []);
app.controller("OrderDetailCtrl", function ($scope, $http) {
  //Checklogin
  let sessionLogin = sessionStorage.getItem("User");
  if (sessionLogin != null) {
      const urlTaiKhoan = `${host}/khachhang/${sessionLogin}`;
      $http.get(urlTaiKhoan).then(resp => {
          if (resp.data.quyen.maQuyen == 1) {
              location.replace("../login.html?loginStatus=" + false);
              $scope.disableKhachHang=true;
          } else if (resp.data.quyen.maQuyen == 2) {
              $scope.disableKhachHang=true;
              $scope.username = sessionLogin;
              $scope.login = true;
          } else {
              $scope.disableKhachHang=false;
              $scope.username = sessionLogin;
              $scope.login = true;
          }
      });

  } else {
      $scope.login = false;
      location.replace("../login.html?loginStatus=" + false);
  }
   $scope.logout = () => {
       sessionStorage.clear();
       localStorage.clear();
       location.replace("../login.html");
   };
    $scope.srcImage = `http://localhost:8080/rest/files/images`;
     //Lấy URL hiện tại
     const urlCurrent = new URL(location.href);
     // Lấy param
     const idHoaDon = urlCurrent.searchParams.get("idHoaDon");
    $scope.load_all = function () {
        const urlHoaDon = `${host}/hoadon/${idHoaDon}`;
        $http.get(urlHoaDon).then((resp) => {
            $scope.donHang=resp.data;
            console.log("Sucsess", resp.data);
        })
        const urlHoaDonChiTiet = `${host}/chitiethoadon/${idHoaDon}`;
        $http.get(urlHoaDonChiTiet).then((resp) => {
            $scope.listChiTietHoaDon=resp.data;
            console.log("Sucsess", resp.data);
        })
    }
    $scope.load_all();
    
});