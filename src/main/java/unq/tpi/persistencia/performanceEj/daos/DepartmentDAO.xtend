package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Department
import unq.tpi.persistencia.util.SessionManager

class DepartmentDAO {

	def getByName(String name) {
		val session = SessionManager.getSession()
		session.createQuery("from Department as d join fetch d.employees where d.name = :name")
				.setParameter("name", name).uniqueResult() as Department
	}

	def getByCode(String num) {
		val session = SessionManager.getSession()
		session.get(Department, num) as Department
	}

    def getEmployeesAndCode(String num) {
		val session = SessionManager.getSession()
		session.createQuery("from Department d join fetch d.employees dye join fetch dye.salaries join fetch dye.titles where d.code = :num")
				.setParameter("num", num).uniqueResult() as Department
	}

	def getAll() {
		val session = SessionManager.getSession()
		session.createCriteria(Department).list() as List<Department>
	}

}
