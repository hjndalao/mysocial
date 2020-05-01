//服务层
app.service('registrationOfCasesService', function ($http) {
    //搜索
    this.findPage = function (page, rows, searchEntity) {
        return $http.post('/mysocial/RegistrationOfCases/search?page=' + page + "&rows=" + rows, searchEntity);
    };
    //增加
    this.insert = function (entity) {
        return $http.post('/mysocial/ultimate/insert', entity);
    };

    this.findOne = function (id) {
        return $http.get('/mysocial/RegistrationOfCases/findOne?id=' + id);
    };
    //修改
    this.update = function (entity) {
        return $http.post('/mysocial/RegistrationOfCases/update', entity);
    };
    //删除单个
    this.delete = function (id) {
        return $http.get('/mysocial/RegistrationOfCases/delete?id=' + id);
    };
    //修改
    this.updateStatus = function (id) {
        return $http.post('/mysocial/RegistrationOfCases/updateStatus?id=' + id);
    };
    //查询结案归档
    this.find = function (page, rows, searchEntity) {
        return $http.post('/mysocial/RegistrationOfCases/find?page=' + page + "&rows=" + rows, searchEntity);
    };
    //科长审核
    this.findUltimate = function (page, rows, searchEntity) {
        return $http.post('/mysocial/ultimate/search?page=' + page + "&rows=" + rows, searchEntity);
    };
    //审核通过
    this.insertR = function (id) {
        console.log(id);
        return $http.get('/mysocial/RegistrationOfCases/insert?id=' + id);
    };
    //审核不通过
    this.deleteOne = function (id) {
        console.log(id);
        return $http.get('/mysocial/ultimate/delete?id=' + id);
    };
    //编辑历史档案
    this.findAll=function (id) {
        console.log("历史档案");
        return $http.get('/mysocial/RegistrationOfCases/findAll?id=' + id);
    }
});
