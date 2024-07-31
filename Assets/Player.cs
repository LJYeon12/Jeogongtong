using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// 카멜명명 법 : 프로그래머들 사이에서 소통을 위해 만들어 놓은 명명법
// 클래스의 첫 문자는 대문자로 시작한다

public class Player : MonoBehaviour
{

    public float speed = 10f; // 접근 제어자 미지정 시 private으로 자동 지정
    Rigidbody playerRigidbody; // 인스턴스

    // 게임이 처음 시작되었을 때 한번 실행
    void Start()
    {
        playerRigidbody = GetComponent<Rigidbody>(); // 게임오브젝트에 찾고싶은 타입을 찾는다
    }

    // 화면이 한번 깜빡일 때 한번 실행
    // 모바일 1초 30 프레임, PC 1초 60프레임, 콘솔 1초 30프레임
    // 1초에 대략 60번 실행, 단 사양에 따라 다르다 -> 몇번 실행될 지 정해져 있지는 않음
    void Update()
    {
        // 유저 입력을 넣자
        /*if (Input.GetKey(KeyCode.W)) // Input.GetKey() : 유니티 엔진에 들어가 있는 함수
        {
            playerRigidbody.AddForce(0, 0, speed);
        }
        if (Input.GetKey(KeyCode.A))
        {
            playerRigidbody.AddForce(-speed, 0, 0);
        }
        if (Input.GetKey(KeyCode.S))
        {
            playerRigidbody.AddForce(0, 0, -speed);
        }
        if (Input.GetKey(KeyCode.D))
        {
            playerRigidbody.AddForce(speed, 0, 0);
        }*/


        // 발사 기능 - "Fire" - 마우스 왼쪽 버튼
        // 앉는 기능 - "Crunch" - 키보드 C
        // 점프 기능 - "Jump" - 키보드 스페이스

        // if (입력("Fire")) -> 총알을 발사
        // if (입력("Jump")) -> 점프를 한다


        // 수평 방향에 대해 키보드나 조이스틱을 입력했을 경우
        // A <-                    -> D
        // -1.0     -0.5   0.5     +1.0
        // -> 키보드는 불가하지만 조이스틱은 -0.3 , 0.5이런 값도 반환가능
        float inputX = Input.GetAxis("Horizontal");
        
        // S, W
        float inputZ = Input.GetAxis("Vertical");

        // 힘을 준 것이기에 가속, 관성이 발생하여 조작이 어려워짐
        //playerRigidbody.AddForce(inputX * speed, 0, inputZ * speed);

        // 속도 자체를 덮어 씌움
        //velocity : 변수, 벡터3를 이용

        Vector3 velocity = new Vector3(inputX, 0, inputZ);
        velocity = velocity*speed;

        // 인스턴스 내에 이미 존재하는 velocity에 변수(velocity)의 값을 할당 
        //playerRigidbody.velocity = velocity;

        /*
         단 velocity로 할당할 경우 중력의 영향을 받아 떨어질 때 느리게 떨어지게 된다
         키보드에서 손을 때었을 경우 x,y,z값은 모두 0으로 초기화 된다
        이때 중력에 영향을 받아 물체는 -9.8의 속도로 떨어져야 한다
        단 유니티 업데이트로 프레임 단위마다 x,y,z의 속도가 0으로 초기화 되기 때문에 떨어지는 속도가 느려지게 된다
         */
        float fallSpeed = playerRigidbody.velocity.y;
        velocity.y = fallSpeed;

        // (inputX*speed, fallSpeed, inputZ*speed)
        playerRigidbody.velocity = velocity;

    }
}
