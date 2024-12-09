using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class CarController : MonoBehaviour
{

    Rigidbody rb;

    [SerializeField]
    float maxSpeed;

    [SerializeField]
    float accel;

    [SerializeField]
    float handling;



    float currentSpeed;
    private Quaternion rot;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
    }


    private void FixedUpdate()
    {



        if (Input.GetKey(KeyCode.LeftShift)) 
        {
            currentSpeed = Mathf.Lerp(currentSpeed, maxSpeed, Time.deltaTime * accel);

            rb.AddForce(transform.right * -currentSpeed, ForceMode.Force);

        }
        if (Input.GetKeyUp(KeyCode.LeftShift))
        {
            currentSpeed = 0;

            rb.AddForce(transform.right * -currentSpeed, ForceMode.Force);

        }


        if (Input.GetKey(KeyCode.LeftArrow)) 
        {
            rot = new Quaternion(0, handling * -1, 0, 0);

            rb.MoveRotation(rot);
        
        }

        if (Input.GetKey(KeyCode.RightArrow)) 
        {
            rot = new Quaternion(0, handling , 0, 0);
            rb.MoveRotation(rot);
        }




    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Death")) 
        {
            SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        
        }
    }




}
