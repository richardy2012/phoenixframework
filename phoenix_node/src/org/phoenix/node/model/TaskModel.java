package org.phoenix.node.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.phoenix.enums.TaskStatusType;
import org.phoenix.node.dto.TaskType;

@Entity
@Table(name="t_task")
public class TaskModel {
	
	private int id;
	private TaskType taskType;
	private String taskName;
	private String taskData;
	private String beanName;
	private SlaveModel slaveModel;
	private String taskParameter;
	private String message;
	private TaskStatusType taskStatusType;
	private Date startTime;
	private Date endTime;
	private int userId;
	public TaskModel() {
	}
	
	public TaskModel(TaskType taskType, String taskName, String taskData,
			SlaveModel slaveModel, String taskParameter,
			TaskStatusType taskStatusType, int userId) {
		super();
		this.taskType = taskType;
		this.taskName = taskName;
		this.taskData = taskData;
		this.slaveModel = slaveModel;
		this.taskParameter = taskParameter;
		this.taskStatusType = taskStatusType;
		this.userId = userId;
	}

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Enumerated(EnumType.STRING)
	public TaskType getTaskType() {
		return taskType;
	}
	public void setTaskType(TaskType taskType) {
		this.taskType = taskType;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getTaskData() {
		return taskData;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void setTaskData(String taskData) {
		this.taskData = taskData;
	}
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=SlaveModel.class)
	@JoinColumn(name="slaveId")
	public SlaveModel getSlaveModel() {
		return slaveModel;
	}

	public void setSlaveModel(SlaveModel slaveModel) {
		this.slaveModel = slaveModel;
	}

	public String getTaskParameter() {
		return taskParameter;
	}
	public void setTaskParameter(String taskParameter) {
		this.taskParameter = taskParameter;
	}
	@Enumerated(EnumType.STRING)
	public TaskStatusType getTaskStatusType() {
		return taskStatusType;
	}
	public void setTaskStatusType(TaskStatusType taskStatusType) {
		this.taskStatusType = taskStatusType;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getBeanName() {
		return beanName;
	}

	public void setBeanName(String beanName) {
		this.beanName = beanName;
	}
}
